from datetime import datetime, timezone
from langchain_ollama import ChatOllama
from langchain.prompts import ChatPromptTemplate
from langchain.chains import LLMChain
from enum import Enum

def calculate_global_age(process_instances):
    all_created_times = []
    all_last_modified_times = []
    terminate_states_present = False

    for process in process_instances:
        state = process.get("state", {})
        if state.get("isTerminateState"):
            terminate_states_present = True

        audit = process.get("auditDetails", {})
        if audit.get("createdTime"):
            all_created_times.append(audit["createdTime"])
        if audit.get("lastModifiedTime"):
            all_last_modified_times.append(audit["lastModifiedTime"])

    if not all_created_times:
        return 0
    global max_modified, second_max
    min_created = min(all_created_times)
    max_modified = max(all_last_modified_times)
    if len(all_last_modified_times) > 1:
        second_max = sorted(all_last_modified_times, reverse=True)[1]
    else:
        second_max = None 
    # print(all_created_times)
    # print(all_last_modified_times)
    # print (min_created)
    # print (max_modified)
    print(datetime.fromtimestamp(max_modified / 1000, tz=timezone.utc))
    print(datetime.fromtimestamp(min_created / 1000, tz=timezone.utc))
    if terminate_states_present and all_last_modified_times:
        max_modified = max(all_last_modified_times)
        age_days = (datetime.fromtimestamp(max_modified / 1000, tz=timezone.utc) -
                    datetime.fromtimestamp(min_created / 1000, tz=timezone.utc)).days
    else:
        age_days = (datetime.now(timezone.utc) -
                    datetime.fromtimestamp(min_created / 1000, tz=timezone.utc)).days

    return age_days


class SLAStatus(str, Enum):
    ON_TRACK = "ON_TRACK"
    AT_RISK = "AT_RISK"
    BREACHED = "BREACHED"
def get_escalation_count(process_instances):
    count = 0
    for item in process_instances:
        if item["escalated"] == True:
            count = count + 1
    return count
def get_reassign_count(process_instances):
    count = 0
    for item in process_instances:
        if item["action"] == "REASSIGN":
            count = count + 1
    return count

def get_time_in_current_state(process_instances):
    days = 0
    if (len(process_instances) > 1) :
        diff_in_ms = max_modified - second_max
        days = diff_in_ms / (1000 * 60 * 60)
    latest_state = max(
        process_instances,
        key=lambda x: x.get("auditDetails", {}).get("lastModifiedTime", 0)
    )

    state = latest_state.get("state").get("state")

    return days, state

def calculate_global_escalations(process_instances):
    return sum(1 for p in process_instances if p.get("escalated"))

def calculate_global_sla(process_instances):
    # If any process has SLA breached → BREACHED, else ON_TRACK
    for p in process_instances:
        if p.get("businesssServiceSla", 0) < 0:
            return "BREACHED"
    return "ON_TRACK"

def get_sla_status(workflow, age_in_days):
    if not workflow:
        return None
    # Find the latest state (max lastModifiedTime)
    latest_state = max(
        workflow,
        key=lambda x: x.get("auditDetails", {}).get("lastModifiedTime", 0)
    )
    business_sla = latest_state.get("businesssServiceSla")
    # Handle missing or invalid SLA
    if business_sla is None:
        return None
    # --- Rule 1: Breached ---
    if business_sla < 0:
        return SLAStatus.BREACHED
    # --- Rule 2: Compute SLA left ---
    age = age_in_days
    sla_days = business_sla / (1000 * 60 * 60 * 24)
    sla_left = sla_days - age
    if sla_left < 3:
        return SLAStatus.AT_RISK
    else:
        return SLAStatus.ON_TRACK

# === Load your JSON ===


# process_instances = sample_json["ProcessInstances"]

def generate_summary(process_instances):
    # === Calculate global values ===
    age_days = calculate_global_age(process_instances)
    escalations = get_escalation_count(process_instances)
    sla_status = get_sla_status(process_instances, age_days)

    # Collect all current states to include in summary
    # current_states = [p["state"]["state"] for p in process_instances]
    # state_summary = ", ".join(current_states)

    days_in_current_state, current_state = get_time_in_current_state(process_instances)
    # current_state = "CURRENT_STATE"
    print(current_state)

    # === Generate a single summary for the entire workflow ===
    prompt = ChatPromptTemplate.from_template("""
    You are an intelligent assistant that creates a human-readable summary for a workflow.

    Given:
    - Age in days: {ageDays}
    - Total escalations: {escalations}
    - SLA status: {slaStatus}
    - Current states: {stateSummary}

    Write a one-sentence summary in natural, conversational English using this format:
    "This workflow is {{ageDays}} days old and  has been escalated {{escalations}} time(s), and is currently in {{stateSummary}}. SLA status: {{slaStatus}}."

    Output only the final summary sentence.
    """)

    llm = ChatOllama(model="mistral", temperature=0.2)
    chain = LLMChain(llm=llm, prompt=prompt)
    summary = chain.run(
        ageDays=age_days,
        escalations=escalations,
        stateSummary=current_state,
        slaStatus=sla_status.replace("_", " ")
    )

    print("=== AI Summary ===\n")
    print(summary)
    result = {
        "summary" : summary,
        "currentAssigneeRole" : "Assign",
        "caseId" : process_instances[0].get("businessId"),
        "explanation" : 
        {
            "Workflow age" : age_days,
            "Escalations" : escalations,
            "Current state" : current_state,
            "SLA Status" : sla_status
        },
        "metrics" : {
        "ageDays" : age_days,
        "escalations" : escalations,
        "currentState" : current_state,
        "currentAssigneeRole" : "Assign",
        "timeInCurrentState" : int(days_in_current_state),
        "sla" : {
            "status" : sla_status,
            # "dueBy": None,
            "breachedBy" : None
        }
        }
    }
    return result



