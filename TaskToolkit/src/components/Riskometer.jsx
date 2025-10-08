import { useEffect, useState } from "react";
import { Box, Typography, Paper } from "@mui/material";
import "./Riskometer.css";

const Riskometer = ({ issues }) => {
  const [riskScore, setRiskScore] = useState(0);

  useEffect(() => {
    const calculateRisk = () => {
      if (!issues || issues.length === 0) return 0;

      let score = 0;
      issues.forEach((issue) => {
        const status = issue.fields?.status?.name?.toLowerCase();
        const priority = issue.fields?.priority?.name?.toLowerCase() || "none";

        if (status === "done" || status === "signoff" || status === "invalid") {
          return;
        }

        const priorityWeights = {
          highest: 6,
          high: 5,
          medium: 3,
          low: 2,
          lowest: 1,
          critical: 7,
          blocker: 8,
          none: 1,
        };

        score += priorityWeights[priority] || 1;
      });

      return score;
    };

    setRiskScore(calculateRisk());
  }, [issues]);

  const maxRisk = 50; // Arbitrary max risk for gauge visualization
  const riskPercent = Math.min((riskScore / maxRisk) * 100, 100);
  const needleRotation = (riskPercent / 100) * 180 - 90;

  const getRiskColor = () => {
    if (riskPercent > 75) return "#f44336"; // Red
    if (riskPercent > 50) return "#ff5722"; // Deep Orange
    if (riskPercent > 40) return "#ff9800"; // Orange
    if (riskPercent > 25) return "#ffc107"; // Amber
    return "#4caf50"; // Green
  };

  const getRiskLabel = () => {
    if (riskPercent > 75) return "CRITICAL RISK";
    if (riskPercent > 50) return "HIGH RISK";
    if (riskPercent > 40) return "MODERATE RISK";
    if (riskPercent > 25) return "LOW RISK";
    return "MINIMAL RISK";
  };

  return (
    <Paper
      elevation={4}
      sx={{
        p: 4,
        mb: 3,
        textAlign: "center",
        background: "linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%)",
        borderRadius: 3,
        position: "relative",
        overflow: "hidden",
        "&::before": {
          content: '""',
          position: "absolute",
          top: 0,
          left: 0,
          right: 0,
          height: "4px",
          background: "linear-gradient(90deg, #4caf50, #ffeb3b, #ff9800, #f44336)",
        },
      }}>
      <Typography
        variant="h5"
        gutterBottom
        sx={{
          fontWeight: 700,
          color: "#1a237e",
          textTransform: "uppercase",
          letterSpacing: 2,
          mb: 3,
        }}>
        🎯 Risk-o-Meter
      </Typography>
      <Box className="gauge-container">
        <div className="gauge">
          <div className="gauge-background"></div>
          <div className="gauge-arc"></div>
          <div className="gauge-overlay"></div>
          <div className="gauge-markers">
            <div className="gauge-marker"></div>
            <div className="gauge-marker"></div>
            <div className="gauge-marker"></div>
            <div className="gauge-marker"></div>
            <div className="gauge-marker"></div>
            <div className="gauge-marker"></div>
            <div className="gauge-marker"></div>
            <div className="gauge-marker"></div>
            <div className="gauge-marker"></div>
          </div>
          <div
            className="gauge-needle"
            style={{
              transform: `rotate(${needleRotation}deg)`,
            }}></div>
          <div className="gauge-center"></div>
        </div>
        <Typography
          variant="h3"
          component="div"
          className="risk-score-display"
          sx={{
            color: getRiskColor(),
            fontWeight: 800,
            mt: 2,
          }}>
          {riskScore}
        </Typography>
        <Typography
          variant="body2"
          className="risk-label"
          sx={{
            color: getRiskColor(),
            fontWeight: 700,
          }}>
          {getRiskLabel()}
        </Typography>
        <Typography
          variant="caption"
          display="block"
          sx={{
            mt: 1,
            color: "text.secondary",
            fontSize: "0.75rem",
          }}>
          Based on {issues?.length || 0} issues
        </Typography>
      </Box>
    </Paper>
  );
};

export default Riskometer;
