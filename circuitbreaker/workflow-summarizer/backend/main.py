"""
Workflow Summary Backend API
FastAPI-based service for workflow summarization and generation
"""

from fastapi import FastAPI, HTTPException, status
from pydantic import BaseModel, Field #remove
from typing import Optional, List, Dict, Any
from datetime import datetime
from enum import Enum
import uuid
from summarizer import generate_summary
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="Workflow Summary API", version="1.0.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # or specific: ["http://localhost:3000"]
    allow_credentials=True,
    allow_methods=["*"],  # or ["POST", "GET", "OPTIONS"]
    allow_headers=["*"],  # or ["Content-Type", "Authorization"]
)


# ============================================
# Enums
# ============================================

class SLAStatus(str, Enum):
    ON_TRACK = "ON_TRACK"
    AT_RISK = "AT_RISK"
    BREACHED = "BREACHED"


class ActionType(str, Enum):
    ESCALATE = "ESCALATE"
    REASSIGN = "REASSIGN"
    APPROVE = "APPROVE"
    REJECT = "REJECT"
    COMMENT = "COMMENT"


# ============================================
# Request Models
# ============================================

class SummaryRequest(BaseModel):
    workflowJson: List = Field(..., description="Complete workflow JSON")
    domain: Optional[str] = Field(None, description="Domain context (e.g., OBPAS)")
    tenantId: Optional[str] = Field(None, description="Tenant identifier")


class SeedWorkflow(BaseModel):
    """Example process instance for generation"""
    # Accept any workflow structure as example
    data: Dict[str, Any] = Field(default_factory=dict)


class GenerateRequest(BaseModel):
    domain: str = Field(..., description="Domain for generation (e.g., OBPAS)")
    count: int = Field(..., ge=1, le=100, description="Number of workflows to generate")
    seeds: List[Dict[str, Any]] = Field(..., description="Example process instances")


# ============================================
# Response Models
# ============================================

class LastAction(BaseModel):
    type: ActionType
    at: datetime
    by: Optional[str] = None


class SLAInfo(BaseModel):
    status: SLAStatus
    # dueBy: datetime
    breachedBy: Optional[datetime] = None


class WorkflowMetrics(BaseModel):
    ageDays: int = Field(..., description="Days since workflow creation")
    escalations: int = Field(default=0)
    reassignments: int = Field(default=0)
    currentState: str
    currentAssigneeRole: str
    timeInCurrentState : int = Field(default=0)
    # lastAction: LastAction
    sla: SLAInfo


class SummaryResponse(BaseModel):
    summary: str = Field(..., description="Human-readable workflow summary")
    metrics: WorkflowMetrics
    explanation: Dict
    caseId: str = Field(..., description="Unique case identifier")
    currentAssigneeRole: str


class GeneratedWorkflow(BaseModel):
    entityID: str
    workflowJson: Dict[str, Any]


class GenerateResponse(BaseModel):
    workflows: List[GeneratedWorkflow]


# ============================================
# Service Layer (Placeholder implementations)
# ============================================

class WorkflowSummaryService:
    """Service to generate summaries from workflow JSON"""
    
    def __init__(self):
        # In production: Initialize LLM client, cache, etc.
        self.cache = {}
    
    def generate_summary(
        self, 
        workflow_json: Dict[str, Any], 
        domain: Optional[str] = None,
        tenant_id: Optional[str] = None
    ) -> SummaryResponse:
        """
        Generate summary from workflow JSON
        
        In production:
        - Parse workflow JSON to extract key information
        - Calculate metrics from workflow history
        - Use LLM to generate human-readable summary
        - Cache results by case ID
        """
        
        # Extract or generate case ID
        case_id = workflow_json.get("caseId") or workflow_json.get("id") or str(uuid.uuid4())
        
        # Mock metrics calculation
        metrics = self._calculate_metrics(workflow_json)
        
        # Mock LLM summary generation
        summary = self._generate_text_summary(workflow_json, metrics, domain)
        
        # Mock explanation
        explanation = self._generate_explanation(metrics)
        
        response = SummaryResponse(
            summary=summary,
            metrics=metrics,
            explanation=explanation,
            caseId=case_id,
            currentAssigneeRole=metrics.currentAssigneeRole
        )
        
        # Cache the result
        self.cache[case_id] = response
        
        return response
    
    def get_cached_summary(self, case_id: str) -> Optional[SummaryResponse]:
        """Retrieve cached summary for a case ID"""
        return self.cache.get(case_id)
    
    def _calculate_metrics(self, workflow_json: Dict[str, Any]) -> WorkflowMetrics:
        """
        Calculate workflow metrics from JSON
        
        In production: Parse workflow history, state transitions, assignments
        """
        
        # Mock implementation
        created_at = datetime.fromisoformat(
            workflow_json.get("createdAt", "2025-09-24T00:00:00Z").replace("Z", "+00:00")
        )
        age_days = (datetime.now().astimezone() - created_at).days
        
        return WorkflowMetrics(
            ageDays=age_days,
            escalations=workflow_json.get("escalationCount", 0),
            reassignments=workflow_json.get("reassignmentCount", 0),
            currentState=workflow_json.get("state", "PENDING_REVIEW"),
            currentAssigneeRole=workflow_json.get("assigneeRole", "Officer"),
            lastAction=LastAction(
                type=ActionType.ESCALATE,
                at=datetime.now().astimezone()
            ),
            sla=SLAInfo(
                status=SLAStatus.AT_RISK,
                dueBy=datetime.now().astimezone()
            )
        )
    
    def _generate_text_summary(
        self, 
        workflow_json: Dict[str, Any], 
        metrics: WorkflowMetrics,
        domain: Optional[str]
    ) -> str:
        """Generate human-readable summary using LLM"""
        
        # Mock summary
        return (
            f"Case has been active for {metrics.ageDays} days and is currently "
            f"in {metrics.currentState} state. Assigned to {metrics.currentAssigneeRole}. "
            f"SLA status: {metrics.sla.status.value}."
        )
    
    def _generate_explanation(self, metrics: WorkflowMetrics) -> str:
        """Generate detailed explanation of workflow status"""
        
        # Mock explanation
        return (
            f"The workflow has experienced {metrics.escalations} escalations and "
            f"{metrics.reassignments} reassignments. Current SLA is {metrics.sla.status.value}."
        )


class WorkflowGeneratorService:
    """Service to generate synthetic workflows"""
    
    def generate_workflows(
        self, 
        domain: str, 
        count: int, 
        seeds: List[Dict[str, Any]]
    ) -> GenerateResponse:
        """
        Generate synthetic workflows based on seed examples
        
        In production:
        - Analyze seed workflows to understand structure
        - Use LLM to generate variations
        - Ensure generated workflows follow domain rules
        """
        
        workflows = []
        
        for i in range(count):
            entity_id = f"{domain}_{uuid.uuid4().hex[:8]}"
            
            # Mock workflow generation based on seeds
            workflow_json = self._generate_workflow(domain, seeds, i)
            
            workflows.append(
                GeneratedWorkflow(
                    entityID=entity_id,
                    workflowJson=workflow_json
                )
            )
        
        return GenerateResponse(workflows=workflows)
    
    def _generate_workflow(
        self, 
        domain: str, 
        seeds: List[Dict[str, Any]], 
        index: int
    ) -> Dict[str, Any]:
        """Generate a single workflow based on seed patterns"""
        
        # Mock: Use seed structure with variations
        base = seeds[0] if seeds else {}
        
        return {
            "id": str(uuid.uuid4()),
            "domain": domain,
            "state": "PENDING_REVIEW",
            "createdAt": datetime.now().isoformat(),
            "assigneeRole": "Officer",
            "generatedIndex": index,
            # Copy relevant fields from seed
            **{k: v for k, v in base.items() if k not in ["id", "createdAt"]}
        }


# ============================================
# Initialize Services
# ============================================

summary_service = WorkflowSummaryService()
generator_service = WorkflowGeneratorService()


# ============================================
# API Endpoints
# ============================================

@app.post("/summaries", response_model=SummaryResponse, status_code=status.HTTP_201_CREATED)
async def create_summary(request: SummaryRequest):
    """
    Generate a summary for a workflow
    
    - Analyzes workflow JSON
    - Calculates metrics
    - Generates human-readable summary
    - Returns case ID for future reference
    """
    try:
        print(request.workflowJson, "ssssss")
        summary = generate_summary(
            request.workflowJson
            # domain=request.domain,
            # tenant_id=request.tenantId
        )
        return summary
    except Exception as e:
        print("Exception occurred:", e)
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Failed to generate summary: {str(e)}"
        )


@app.get("/summaries/{case_id}", response_model=SummaryResponse)
async def get_summary(case_id: str):
    """
    Retrieve cached summary for a case ID
    
    Returns the latest summary generated for the specified case/entity ID
    """
    summary = summary_service.get_cached_summary(case_id)
    
    if not summary:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"No summary found for case ID: {case_id}"
        )
    
    return summary


@app.post("/generate", response_model=GenerateResponse)
async def generate_workflows(request: GenerateRequest):
    """
    Generate synthetic workflows based on seed examples
    
    - Takes seed workflow examples
    - Generates specified count of variations
    - Returns complete workflow JSONs with entity IDs
    """
    try:
        result = generator_service.generate_workflows(
            domain=request.domain,
            count=request.count,
            seeds=request.seeds
        )
        return result
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Failed to generate workflows: {str(e)}"
        )


@app.get("/health")
async def health_check():
    """Health check endpoint"""
    return {"status": "healthy", "timestamp": datetime.now().isoformat()}


# ============================================
# Run with: uvicorn main:app --reload
# ============================================

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
