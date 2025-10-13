from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import pandas as pd
import requests
from typing import Optional

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Load datasets
processInstance = pd.read_csv('./Dataset/eg_wf_processinstance_v2.csv')
businessService = pd.read_csv('./Dataset/eg_wf_businessservice_v2.csv')
wf_action = pd.read_csv('./Dataset/eg_wf_action_v2.csv')
wf_state = pd.read_csv('./Dataset/eg_wf_state_v2.csv')


def merge_workflow_data():
    """Merge all workflow datasets into a single JSON structure"""

    # Create lookup dictionaries for state and action names
    state_lookup = wf_state.set_index(['uuid', 'tenantid'])['state'].to_dict()

    # Merge processInstance with businessService
    merged = processInstance.merge(
        businessService,
        on=['businessservice', 'tenantid'],
        how='left',
        suffixes=('', '_bs')
    )

    # Merge with wf_action to get action names
    merged = merged.merge(
        wf_action[['uuid', 'tenantid', 'action',
                   'currentstate', 'nextstate', 'roles']],
        left_on=['action', 'tenantid'],
        right_on=['uuid', 'tenantid'],
        how='left',
        suffixes=('', '_action')
    )
    merged.rename(columns={'action_action': 'action_name'}, inplace=True)

    # Merge with wf_state to get current state name
    merged = merged.merge(
        wf_state[['uuid', 'tenantid', 'businessserviceid',
                  'state', 'applicationstatus', 'isterminatestate']],
        left_on=['status', 'tenantid'],
        right_on=['uuid', 'tenantid'],
        how='left',
        suffixes=('', '_current_state')
    )
    merged.rename(columns={'state': 'current_state_name'}, inplace=True)

    # Map currentstate UUID to state name
    merged['currentstate_name'] = merged.apply(
        lambda row: state_lookup.get(
            (row['currentstate'], row['tenantid']), ''),
        axis=1
    )

    # Map nextstate UUID to state name
    merged['nextstate_name'] = merged.apply(
        lambda row: state_lookup.get((row['nextstate'], row['tenantid']), ''),
        axis=1
    )

    # Convert to JSON-serializable format
    merged = merged.fillna('')
    return merged.to_dict('records')


workflow_data = merge_workflow_data()
print(
    f"Workflow data merged successfully. Total records: {len(workflow_data)}")

# Convert to DataFrame for easier querying
workflow_df = pd.DataFrame(workflow_data)


class WorkflowSummaryRequest(BaseModel):
    application_number: Optional[str] = None
    module: Optional[str] = None
    tenantid: Optional[str] = None
    businessservice: Optional[str] = None
    status: Optional[str] = None
    sla: Optional[int] = None


def get_workflow_history(filters: dict):
    """Get workflow history based on provided filters"""
    filtered = workflow_df.copy()

    # Apply filters dynamically
    if filters.get('application_number'):
        filtered = filtered[filtered['businessid']
                            == filters['application_number']]

    if filters.get('module'):
        filtered = filtered[filtered['modulename'] == filters['module']]

    if filters.get('tenantid'):
        filtered = filtered[filtered['tenantid'] == filters['tenantid']]

    if filters.get('businessservice'):
        filtered = filtered[filtered['businessservice']
                            == filters['businessservice']]

    if filters.get('status'):
        filtered = filtered[filtered['current_state_name']
                            == filters['status']]

    # Sort by creation time
    if len(filtered) > 0:
        filtered = filtered.sort_values('createdtime')

    return filtered.to_dict('records')


def generate_workflow_summary(workflow_history: list) -> str:
    """Generate workflow detailed  summary using Ollama"""
    if not workflow_history:
        return "No workflow history found for the given parameters."

    # Get first and last step for time calculation
    first_step = workflow_history[0]
    last_step = workflow_history[-1]

    # Calculate time taken
    time_taken_ms = last_step.get(
        'createdtime', 0) - first_step.get('createdtime', 0)
    time_taken_hours = time_taken_ms / (1000 * 60 * 60)

    # Build compact context
    workflow_steps = []
    for idx, step in enumerate(workflow_history, 1):
        step_info = f"{idx}. {step.get('action_name', 'N/A')} → {step.get('current_state_name', 'N/A')}"
        if step.get('comment'):
            step_info += f" (Comment: {step.get('comment')})"
        workflow_steps.append(step_info)

    # Ollama API call with concise prompt
    prompt = f"""Summarize this workflow in 3-4 sentences:

Application: {first_step.get('businessid', 'N/A')}
Module: {first_step.get('modulename', 'N/A')}
Total Steps: {len(workflow_history)}
Current Status: {last_step.get('current_state_name', 'N/A')}
Time Taken: {time_taken_hours:.2f} hours

Steps:
{chr(10).join(workflow_steps[:10])}

Provide a brief professional summary."""

    try:
        response = requests.post(
            'http://localhost:11434/api/generate',
            json={
                'model': 'mistral',
                'prompt': prompt,
                'stream': False,
                'options': {
                    'temperature': 0.7,
                    'num_predict': 150
                }
            },
            timeout=120
        )

        if response.status_code == 200:
            return response.json()['response']
        else:
            return f"Error generating summary: {response.status_code}"
    except Exception as e:
        return f"Error connecting to Ollama: {str(e)}"


@app.post("/workflow-summary")
async def workflow_summary(request: WorkflowSummaryRequest):
    """
    Generate a workflow pointer using Ollama 

    Parameters (all optional, provide at least one):
    - application_number: Business ID (e.g., 'PG-PGR-2025-04-01-000038')
    - module: Module name (e.g., 'pgr-services')
    - tenantid: Tenant ID (e.g., 'pg.citya')
    - businessservice: Business service name (e.g., 'PGR')
    - status: Current state name (e.g., 'APPROVED', 'PENDING_FOR_APPROVAL')
    - sla: Optional SLA in milliseconds
    """

    # Convert request to filters dict
    filters = {
        'application_number': request.application_number,
        'module': request.module,
        'tenantid': request.tenantid,
        'businessservice': request.businessservice,
        'status': request.status
    }

    # Remove None values
    filters = {k: v for k, v in filters.items() if v is not None}

    if not filters:
        raise HTTPException(
            status_code=400,
            detail="Please provide at least one search parameter (application_number, module, tenantid, businessservice, or status)"
        )

    # Get workflow history
    history = get_workflow_history(filters)

    if not history:
        raise HTTPException(
            status_code=404,
            detail=f"No workflow found for the provided filters: {filters}"
        )

    # If tenantid filter is provided, generate tenant-level analytics (module-wise breakdown)
    if request.tenantid and not request.module:
        # Get all applications for this tenant
        tenant_df = workflow_df[workflow_df['tenantid'] == request.tenantid]

        # Get latest status for each unique application
        latest_status_df = tenant_df.sort_values('createdtime').groupby('businessid').tail(1)

        # Module-wise breakdown
        module_wise_analytics = {}

        for module in latest_status_df['modulename'].unique():
            module_data = latest_status_df[latest_status_df['modulename'] == module]

            # Status counts for this module
            status_counts = module_data.groupby('current_state_name').size().to_dict()

            module_wise_analytics[module] = {
                "total_applications": len(module_data),
                "status_wise_count": status_counts
            }

        # Overall tenant stats
        total_apps = latest_status_df['businessid'].nunique()
        overall_status_counts = latest_status_df.groupby('current_state_name').size().to_dict()

        # Generate AI summary for tenant analytics
        tenant_prompt = f"""Summarize this tenant analytics :

Tenant ID: {request.tenantid}
Total Applications: {total_apps}
Overall Status Distribution: {', '.join([f'{k}: {v}' for k, v in overall_status_counts.items()])}

Module-wise Breakdown:
"""
        for module, data in module_wise_analytics.items():
            tenant_prompt += f"\n{module}: {data['total_applications']} applications - "
            tenant_prompt += ', '.join([f"{k}: {v}" for k, v in data['status_wise_count'].items()])

        try:
            tenant_summary_response = requests.post(
                'http://localhost:11434/api/generate',
                json={
                    'model': 'mistral',
                    'prompt': tenant_prompt,
                    'stream': False,
                    'options': {
                        'temperature': 0.7,
                        'num_predict': 200
                    }
                },
                timeout=120
            )

            if tenant_summary_response.status_code == 200:
                tenant_summary = tenant_summary_response.json()['response']
            else:
                tenant_summary = f"Error generating summary: {tenant_summary_response.status_code}"
        except Exception as e:
            tenant_summary = f"Error connecting to Ollama: {str(e)}"

        return {
            "filters_applied": filters,
            "tenant_analytics": {
                "total_applications": total_apps,
                "overall_status_counts": overall_status_counts,
                "module_wise_breakdown": module_wise_analytics,
                "analytics_summary": tenant_summary
            }
        }

    # If module filter is provided, generate module-level analytics
    if request.module:
        # Get all applications for this module
        module_df = workflow_df[workflow_df['modulename'] == request.module]

        # Count unique applications
        unique_apps = module_df['businessid'].nunique()

        # Get latest status for each unique application
        latest_status_df = module_df.sort_values('createdtime').groupby('businessid').tail(1)

        # Calculate ticket age and add labels
        current_time = pd.Timestamp.now().timestamp() * 1000
        latest_status_df = latest_status_df.copy()
        latest_status_df['ticket_age_hours'] = (current_time - latest_status_df['createdtime']) / (1000 * 60 * 60)
        latest_status_df['ticket_age_days'] = latest_status_df['ticket_age_hours'] / 24

        # Status-wise count based on current/latest status of each application
        status_counts = latest_status_df.groupby(
            'current_state_name').size().to_dict()

        # SLA analysis if SLA is provided
        sla_analysis = {}
        sla_details = {}
        stuck_applications = []

        if request.sla:
            # Filter only non-terminated applications for SLA calculation
            active_apps_df = latest_status_df[latest_status_df['isterminatestate'] != True].copy()

            # Use latest status for each application for SLA calculation
            sla_hours = request.sla / (1000 * 60 * 60)  # Convert ms to hours
            active_apps_df['sla_threshold_hours'] = sla_hours * 0.8  # 80% for nearing

            # Add SLA labels
            def get_sla_label(age_hours, sla_hours):
                threshold = sla_hours * 0.8
                if age_hours >= sla_hours:
                    return "BREACHED"
                elif age_hours >= threshold:
                    return "AT_RISK"
                else:
                    return "WITHIN_SLA"

            active_apps_df['sla_label'] = active_apps_df.apply(
                lambda row: get_sla_label(row['ticket_age_hours'], sla_hours), axis=1
            )

            # Categorize by SLA status (only for active/non-terminated applications)
            within_sla = active_apps_df[active_apps_df['sla_label'] == 'WITHIN_SLA']
            at_risk = active_apps_df[active_apps_df['sla_label'] == 'AT_RISK']
            breached_sla = active_apps_df[active_apps_df['sla_label'] == 'BREACHED']

            sla_analysis = {
                "within_sla": {
                    "count": len(within_sla),
                    "by_status": within_sla.groupby('current_state_name').size().to_dict()
                },
                "at_risk": {
                    "count": len(at_risk),
                    "by_status": at_risk.groupby('current_state_name').size().to_dict()
                },
                "breached_sla": {
                    "count": len(breached_sla),
                    "by_status": breached_sla.groupby('current_state_name').size().to_dict()
                }
            }

            # Get stuck applications (not terminated and at risk or breached)
            stuck_df = active_apps_df[
                (active_apps_df['sla_label'].isin(['AT_RISK', 'BREACHED']))
            ]

            stuck_applications = stuck_df[[
                'businessid', 'current_state_name', 'ticket_age_days',
                'sla_label', 'roles'
            ]].to_dict('records')

            # Format stuck applications with readable data
            for app in stuck_applications:
                app['ticket_age_days'] = round(app['ticket_age_days'], 2)
                app['stuck_with_role'] = app.pop('roles', 'Unknown')

            # Detailed SLA breakdown with application IDs
            sla_details = {
                "within_sla": {
                    "applications": within_sla[['businessid', 'current_state_name', 'ticket_age_days', 'sla_label']].to_dict('records')
                },
                "at_risk": {
                    "applications": at_risk[['businessid', 'current_state_name', 'ticket_age_days', 'sla_label']].to_dict('records')
                },
                "breached_sla": {
                    "applications": breached_sla[['businessid', 'current_state_name', 'ticket_age_days', 'sla_label']].to_dict('records')
                }
            }

            # Round ticket ages
            for category in sla_details.values():
                for app in category['applications']:
                    app['ticket_age_days'] = round(app['ticket_age_days'], 2)

        # Generate AI summary for module analytics
        analytics_prompt = f"""Summarize this module detailed analytics :

Module: {request.module}
Total Applications: {unique_apps}
Status Distribution: {', '.join([f'{k}: {v}' for k, v in status_counts.items()])}
"""

        if sla_analysis:
            analytics_prompt += f"""
SLA Performance:
- Within SLA: {sla_analysis['within_sla']['count']} applications
- At Risk: {sla_analysis['at_risk']['count']} applications
- Breached SLA: {sla_analysis['breached_sla']['count']} applications
- Stuck Applications: {len(stuck_applications)} applications need attention
"""

        try:
            analytics_summary_response = requests.post(
                'http://localhost:11434/api/generate',
                json={
                    'model': 'mistral',
                    'prompt': analytics_prompt,
                    'stream': False,
                    'options': {
                        'temperature': 0.7,
                        'num_predict': 150
                    }
                },
                timeout=120
            )

            if analytics_summary_response.status_code == 200:
                analytics_summary = analytics_summary_response.json()[
                    'response']
            else:
                analytics_summary = f"Error generating summary: {analytics_summary_response.status_code}"
        except Exception as e:
            analytics_summary = f"Error connecting to Ollama: {str(e)}"

        return {
            "filters_applied": filters,
            "module_analytics": {
                "total_applications": unique_apps,
                "status_wise_count": status_counts,
                "sla_summary": sla_analysis if sla_analysis else "SLA not provided",
                "sla_details": sla_details if sla_details else "SLA not provided",
                "stuck_applications": stuck_applications if stuck_applications else [],
                "analytics_summary": analytics_summary
            }
        }

    # Generate summary using Ollama
    summary = generate_workflow_summary(history)

    return {
        "filters_applied": filters,
        "total_steps": len(history),
        "workflow_history": history,
        "summary": summary
    }


@app.get("/")
async def root():
    return {"message": "Workflow Summarizer API", "total_workflows": len(workflow_df)}
