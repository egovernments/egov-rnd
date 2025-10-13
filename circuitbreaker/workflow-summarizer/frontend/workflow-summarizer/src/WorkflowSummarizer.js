import React, { useState } from "react";
import {
  Upload,
  AlertCircle,
  Clock,
  Users,
  RefreshCw,
  TrendingUp,
  ChevronDown,
  ChevronUp,
  FileText,
  Timer,
  Activity,
} from "lucide-react";
import "./WorkflowSummarizerUI.css";
import DigitLogo from "../src/image 5.png";

const WorkflowSummarizerUI = () => {
  const [jsonInput, setJsonInput] = useState("");
  const [domain, setDomain] = useState("PGR");
  const [loading, setLoading] = useState(false);
  const [summary, setSummary] = useState(null);
  const [error, setError] = useState("");
  const [showExplainer, setShowExplainer] = useState(false);
  const [activeTab, setActiveTab] = useState("input");
  const [history, setHistory] = useState([]);
  const [inputData, setInputDate] = useState([]);

  const seedExamples = {
    OBPAS: {
      happyPath: {
        processInstanceId: "obpas-2025-001",
        businessService: "OBPAS",
        state: { state: "APPROVED" },
        auditDetails: { createdTime: Date.now() - 5 * 24 * 60 * 60 * 1000 },
      },
      withEscalation: {
        processInstanceId: "obpas-2025-002",
        businessService: "OBPAS",
        escalationCount: 2,
        state: { state: "PENDING_FINANCE_APPROVAL" },
        auditDetails: { createdTime: Date.now() - 14 * 24 * 60 * 60 * 1000 },
      },
    },
    PT: {
      happyPath: {
        processInstanceId: "pt-2025-001",
        businessService: "PT_MUTATION",
        state: { state: "APPROVED" },
        auditDetails: { createdTime: Date.now() - 3 * 24 * 60 * 60 * 1000 },
      },
    },
    PGR: {
      happyPath: {
        processInstanceId: "pgr-2025-001",
        businessService: "PGR",
        state: { state: "RESOLVED" },
        auditDetails: { createdTime: Date.now() - 2 * 24 * 60 * 60 * 1000 },
      },
      withEscalation: {
        processInstanceId: "pgr-2025-002",
        businessService: "PGR",
        escalationCount: 1,
        state: { state: "PENDING_RESOLUTION" },
        auditDetails: { createdTime: Date.now() - 7 * 24 * 60 * 60 * 1000 },
      },
    },
  };

  const roleLabels = {
    ARCHITECT: "Architect",
    TECHNICAL_OFFICER: "Technical Officer",
    FINANCE_OFFICER: "Finance Officer",
    SENIOR_OFFICER: "Senior Officer",
  };

  const stateLabels = {
    INITIATED: "Initiated",
    PENDING_FINANCE_APPROVAL: "Pending Finance Approval",
    PENDING_RESOLUTION: "Pending Resolution",
    APPROVED: "Approved",
    RESOLVED: "Resolved",
  };

  // const handleFileUpload = (e) => {
  //   const file = e.target.files[0];
  //   if (file) {
  //     const reader = new FileReader();
  //     reader.onload = (event) => setJsonInput(event.target.result);
  //     reader.readAsText(file);
  //   }
  // };

  const handleFileUpload = (e) => {
    const file = e.target.files[0];
    if (file) {
      // Validate file type
      // if (!file.name.endsWith('.json')) {
      //   setError('Please upload a valid JSON file');
      //   return;
      // }

      const reader = new FileReader();

      reader.onload = (event) => {
        try {
          const fileContent = event.target.result;
          // Validate JSON format
          JSON.parse(fileContent);
          setJsonInput(fileContent);
          setError(""); // Clear any previous errors
        } catch (err) {
          setError("Invalid JSON file. Please check the file content.");
        }
      };

      reader.onerror = () => {
        setError("Failed to read file. Please try again.");
      };

      reader.readAsText(file);
    }
  };

  const loadSeedExample = (type) => {
    const example = seedExamples[domain][type];
    if (example) setJsonInput(JSON.stringify(example, null, 2));
  };

  // const handleSubmit = () => {
  //   setError("");
  //   setLoading(true);

  //   try {
  //     const workflowData = JSON.parse(jsonInput);

  //     setTimeout(() => {
  //       const now = Date.now();
  //       const createdTime =
  //         workflowData.auditDetails?.createdTime ||
  //         now - 14 * 24 * 60 * 60 * 1000;
  //       const ageDays = Math.floor((now - createdTime) / (1000 * 60 * 60 * 24));

  //       const escalations = workflowData.escalationCount || 0;
  //       const currentState = workflowData.state?.state || "PENDING";
  //       const processId =
  //         workflowData.processInstanceId || `${domain}-${Date.now()}`;
  //       const slaStatus =
  //         ageDays > 10 ? "AT_RISK" : ageDays > 14 ? "BREACHED" : "ON_TRACK";

  //       const summaryText = `This ${domain} application is ${ageDays} days old${
  //         escalations > 0 ? `, has been escalated ${escalations} time(s)` : ""
  //       }, and is currently in ${
  //         stateLabels[currentState] || currentState
  //       } state. SLA status: ${slaStatus.replace("_", " ")}.`;

  //       const generatedSummary = {
  //         summary: summaryText,
  //         metrics: {
  //           ageDays: ageDays || 7,
  //           escalations: escalations,
  //           reassignments: workflowData.reassignments || 0,
  //           currentState: currentState,
  //           currentAssigneeRole: workflowData.currentAssigneeRole || "Unknown",
  //           timeInCurrentState: 96,
  //           sla: { status: slaStatus },
  //         },
  //         explanation: [
  //           `Workflow age: ${ageDays} days`,
  //           escalations > 0
  //             ? `${escalations} escalation(s) detected`
  //             : "No escalations",
  //           `Current state: ${stateLabels[currentState] || currentState}`,
  //           `SLA status: ${slaStatus.replace("_", " ")}`,
  //         ],
  //         caseId: processId,
  //         currentAssigneeRole: workflowData.currentAssigneeRole || "Unknown",
  //         timeline: workflowData.timeline || [

  //         { action: "SUBMITTED", role: "Architect", timestamp: "2025-09-24T09:00:00Z", state: "INITIATED" },
  //         { action: "DOCUMENT_VERIFIED", role: "Document Verifier", timestamp: "2025-09-24T10:15:00Z", state: "PENDING_TECHNICAL_REVIEW" },
  //         { action: "ASSIGNED", role: "Technical Officer", timestamp: "2025-09-24T11:30:00Z", state: "PENDING_TECHNICAL_REVIEW" },
  //         { action: "APPROVED_TECHNICAL", role: "Technical Officer", timestamp: "2025-09-27T14:30:00Z", state: "PENDING_FINANCE_APPROVAL" },
  //         { action: "ESCALATE", role: "Senior Officer", timestamp: "2025-10-01T11:20:00Z", state: "PENDING_FINANCE_APPROVAL" },
  //         { action: "ESCALATE", role: "Senior Officer", timestamp: "2025-10-03T09:15:00Z", state: "PENDING_FINANCE_APPROVAL" },
  //         { action: "REASSIGN", role: "GPOx", timestamp: "2025-10-04T08:45:00Z", state: "PENDING_FINANCE_APPROVAL" }
  //       ]

  //       };

  //       setSummary(generatedSummary);

  //       setHistory((prev) => [
  //         {
  //           caseId: processId,
  //           summary: summaryText,
  //           timestamp: new Date(),
  //           metrics: generatedSummary.metrics,
  //         },
  //         ...prev,
  //       ]);

  //       setLoading(false);
  //     }, 1000);
  //   } catch (err) {
  //     setError("Invalid JSON format. Please check your input.");
  //     setLoading(false);
  //   }
  // };

  const handleSubmit = async () => {
    setError("");
    setLoading(true);

    try {
      const workflowData = JSON.parse(jsonInput);
      setInputDate(workflowData);
      const requestBody = {
        workflowJson: workflowData,
        domain: domain,
        tenantId: workflowData.tenantId || undefined,
      };
      console.log("request", requestBody);
      const response = await fetch("http://192.168.200.219:8000/summaries", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        // body: {
        //   workflowJson: requestBody?.workflowData?.[0],
        //   domain: requestBody?.domain,
        //   tenantId: workflowData.tenantId || undefined
        // },
        body: JSON.stringify(requestBody),
      });

      if (!response.ok) {
        throw new Error("Failed to get summary from API");
      }

      const result = await response.json();

      setSummary({
        summary: result.summary,
        metrics: result.metrics,
        explanation: result.explanation,
        caseId: result.caseId,
        currentAssigneeRole: result.currentAssigneeRole,
        timeline: workflowData.timeline || [],
      });

      setHistory((prev) => [
        {
          caseId: result.caseId,
          summary: result.summary,
          timestamp: new Date(),
          metrics: result.metrics,
        },
        ...prev,
      ]);

      setLoading(false);
    } catch (err) {
      setError(err.message || "Invalid JSON or API error");
      setLoading(false);
    }
  };

  const getStatusColor = (status) => {
    const colors = {
      ON_TRACK: "bg-green-100 text-green-800 border-green-300",
      AT_RISK: "bg-yellow-100 text-yellow-800 border-yellow-300",
      BREACHED: "bg-red-100 text-red-800 border-red-300",
    };
    return colors[status] || "bg-gray-100 text-gray-800 border-gray-300";
  };

  const getSLAClass = (status) => {
    console.log("status", status);
    switch (status) {
      case "ON_TRACK":
        return "on-track";
      case "at risk":
        return "sla-chip at-risk";
      case "breached":
        return "sla-chip breached";
      default:
        return "sla-chip neutral";
    }
  };
  const formatDate = (dateStr) => {
    return new Date(dateStr).toLocaleString("en-IN", {
      day: "2-digit",
      month: "short",
      hour: "2-digit",
      minute: "2-digit",
    });
  };

  const formatTimeInState = (hours) => {
    if (hours < 24) return `${hours}h`;
    const days = Math.floor(hours / 24);
    const remainingHours = hours % 24;
    return remainingHours > 0 ? `${days}d ${remainingHours}h` : `${days}d`;
  };

  return (
    <div className="workflow-container">
      <div className="workflow-header">
        <div className="header-top">
          <img src={DigitLogo} alt="DIGIT Logo" className="digit-logo" />
          <h1>DIGIT Workflow Summarizer</h1>
        </div>
        <p>
          Paste workflow JSON or upload a file to generate intelligent summaries
        </p>
      </div>

      <div className="workflow-grid">
        {/* LEFT PANEL */}
        <div className="workflow-card">
          <div className="workflow-card-header">
            <h2>Workflow Input</h2>
            <div className="workflow-tabs">
              <button
                className={activeTab === "input" ? "active" : ""}
                onClick={() => setActiveTab("input")}
              >
                Input
              </button>
              <button
                className={activeTab === "history" ? "active" : ""}
                onClick={() => setActiveTab("history")}
              >
                History ({history.length})
              </button>
            </div>
          </div>

          {activeTab === "input" ? (
            <>
              <div className="form-group">
                <label>Domain</label>
                <select
                  value={domain}
                  onChange={(e) => setDomain(e.target.value)}
                >
                  <option value="PGR">PGR (Public Grievance Redressal)</option>
                  <option value="OBPAS">OBPAS (Building Plan Approval)</option>
                  <option value="PT">PT (Property Tax)</option>
                </select>
              </div>

              <div className="form-group">
                <label>Load Seed Example</label>
                <div className="button-row">
                  <button
                    className="btn-green"
                    onClick={() => loadSeedExample("happyPath")}
                  >
                    Happy Path
                  </button>
                  <button
                    className="btn-yellow"
                    onClick={() => loadSeedExample("withEscalation")}
                  >
                    With Escalation
                  </button>
                </div>
              </div>

              <div className="form-group">
                <label>Upload JSON File</label>
                <label className="upload-box">
                  <Upload className="icon" />
                  <p>Click to upload or drag and drop</p>
                  <input
                    type="file"
                    accept=".json"
                    onChange={handleFileUpload}
                  />
                </label>
              </div>

              <div className="form-group">
                <label>Paste JSON</label>
                <textarea
                  value={jsonInput}
                  onChange={(e) => setJsonInput(e.target.value)}
                  placeholder='{"processInstanceId": "..."}'
                />
              </div>

              {error && (
                <div className="error-box">
                  <AlertCircle className="icon" />
                  <span>{error}</span>
                </div>
              )}

              <button
                className="btn-primary"
                onClick={handleSubmit}
                disabled={!jsonInput || loading}
              >
                {loading ? "Generating Summary..." : "Generate Summary"}
              </button>
            </>
          ) : (
            <div className="history-box">
              {history.length === 0 ? (
                <div className="empty-history">
                  <FileText className="icon-large" />
                  <p>No summaries generated yet</p>
                </div>
              ) : (
                history.map((item, idx) => (
                  <div
                    key={idx}
                    className="history-item"
                    // onClick={() => {
                    //   setSummary({
                    //     summary: item.summary,
                    //     caseId: item.caseId,
                    //     metrics: item.metrics,
                    //     explanation: ["dskfjhsuy"],
                    //   });
                    //   setActiveTab("input");
                    // }}
                  >
                    <span className="case-id">{item.caseId}</span>
                    <p>{item.summary}</p>
                  </div>
                ))
              )}
            </div>
          )}
        </div>

        {/* RIGHT PANEL */}
        <div className="workflow-card">
          {loading ? (
            <div className="loading-state">
              <div className="spinner"></div>
              <p>Generating Summary...</p>
            </div>
          ) : !summary ? (
            <div className="empty-summary">
              <TrendingUp className="icon-large" />
              <p>Summary will appear here</p>
            </div>
          ) : (
            <div className="summary-section">
              <div className="summary-header">
                <h2>Summary</h2>
                <div className={getSLAClass(summary.metrics.sla.status)}>
                  {summary.metrics.sla.status.replace("_", " ")}
                </div>
              </div>

              <div className="summary-box highlight">
                <p className="summary-text">{summary.summary}</p>
                <p className="case-id">Case ID: {summary.caseId}</p>
              </div>

              <div className="metrics">
                <div className="metric">
                  <Clock className="icon" />
                  <div>
                    <p>Age</p>
                    <h3>{summary.metrics.ageDays} days</h3>
                  </div>
                </div>
                <div className="metric">
                  <TrendingUp className="icon" />
                  <div>
                    <p>Escalations</p>
                    <h3>{summary.metrics.escalations}</h3>
                  </div>
                </div>
                <div className="metric">
                  <Users className="icon" />
                  <div>
                    <p className="metric-label">Current Role</p>
                    <h3 className="metric-value">
                      {summary.metrics.currentAssigneeRole}
                    </h3>
                  </div>
                </div>

                <div className="metric">
                  <RefreshCw className="icon" />
                  <div>
                    <p className="metric-label">Reassignments</p>
                    <h3 className="metric-value">
                      {summary.metrics.reassignments}
                    </h3>
                  </div>
                </div>

                <div className="metric">
                  <Timer className="icon" />
                  <div>
                    <p className="metric-label">Time in Current State</p>
                    <h3 className="metric-value">
                      {formatTimeInState(summary.metrics.timeInCurrentState)}
                    </h3>
                    <p className="metric-sub">
                      {stateLabels[summary.metrics.currentState] ||
                        summary.metrics.currentState}
                    </p>
                  </div>
                </div>
              </div>

              {/* <div className="timeline-section">
                <h3 className="timeline-heading">
                  <Activity className="icon" />
                  Mini Timeline (Last 5 Events)
                </h3>
                <div className="timeline-box">
                  {summary.timeline
                    .slice(-5)
                    .reverse()
                    .map((event, idx) => (
                      <div key={idx} className="timeline-event">
                        {idx !== summary.timeline.slice(-5).length - 1 && (
                          <div className="timeline-line"></div>
                        )}
                        <div className="timeline-dot"></div>
                        <div className="timeline-card">
                          <div className="timeline-header">
                            <span className="timeline-action">
                              {event.action.replace(/_/g, " ")}
                            </span>
                            <span className="timeline-date">
                              {formatDate(event.timestamp)}
                            </span>
                          </div>
                          <div className="timeline-body">
                            <p className="timeline-role">{event.role}</p>
                            <span className="timeline-state">
                              {stateLabels[event.state] || event.state}
                            </span>
                          </div>
                        </div>
                      </div>
                    ))}
                </div>
              </div> */}

              <div className="timeline-section">
                <h3 className="timeline-heading">
                  <Activity className="icon" />
                  Mini Timeline (
                  {inputData.length > 5
                    ? "Latest 5 Events"
                    : "All Events"}
                  )
                </h3>

                <div className="timeline-box">
                  {(() => {
                    // 1️⃣ Ensure timeline exists and is an array
                    if (
                      !inputData ||
                      !Array.isArray(inputData) ||
                      inputData.length === 0
                    ) {
                      return <p>No events available</p>;
                    }

                    // 2️⃣ Sort timeline by timestamp if available
                    const sortedTimeline = [...inputData].sort(
                      (a, b) => new Date(b.auditDetails.createdTime) - new Date(a.auditDetails.createdTime)
                    );

                    // 3️⃣ Pick latest 5 or all
                    const eventsToShow =
                      sortedTimeline.length > 5
                        ? sortedTimeline.slice(0, 5)
                        : sortedTimeline;

                    // 4️⃣ Render events
                    return eventsToShow.map((event, idx) => (
                      <div key={idx} className="timeline-event">
                        {/* Only show connecting line if not the last event */}
                        {idx !== eventsToShow.length - 1 && (
                          <div className="timeline-line"></div>
                        )}

                        <div className="timeline-dot"></div>
                        <div className="timeline-card">
                          <div className="timeline-header">
                            <span className="timeline-action">
                              {event.action?.replace(/_/g, " ") ||
                                "Unknown Action"}
                            </span>
                            <span className="timeline-date">
                              {formatDate(event.auditDetails.createdTime)}
                            </span>
                          </div>
                          <div className="timeline-body">
                            <p className="timeline-role">
                              {event.assigner.roles[0].name || "Unknown Role"}
                            </p>
                            <span className="timeline-state">
                              {stateLabels[event.state.state] ||
                                event.state.state ||
                                "Unknown State"}
                            </span>
                          </div>
                        </div>
                      </div>
                    ));
                  })()}
                </div>
              </div>

              {/* <div className="explanation">
                <button
                  onClick={() => setShowExplainer(!showExplainer)}
                  className="explain-btn"
                >
                  Why this summary?
                  {showExplainer ? (
                    <ChevronUp className="icon" />
                  ) : (
                    <ChevronDown className="icon" />
                  )}
                </button>
                {showExplainer && (
                  <ul>
                    {summary.explanation.map((fact, idx) => (
                      <li key={idx}>• {fact}</li>
                    ))}
                  </ul>
                )}
              </div> */}
              <div className="explanation">
                <button
                  onClick={() => setShowExplainer(!showExplainer)}
                  className="explain-btn"
                >
                  Why this summary?
                  {showExplainer ? (
                    <ChevronUp className="icon" />
                  ) : (
                    <ChevronDown className="icon" />
                  )}
                </button>
                {showExplainer && (
                  <ul style={{ textAlign: "left", paddingLeft: "20px" }}>
                    {summary?.explanation &&
                      Object.entries(summary.explanation).map(
                        ([key, value], idx) => (
                          <li key={idx}>
                            <strong>{key}:</strong> {String(value)}
                          </li>
                        )
                      )}
                  </ul>
                )}
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  );
};

export default WorkflowSummarizerUI;
