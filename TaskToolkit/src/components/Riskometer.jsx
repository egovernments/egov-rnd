import { useEffect, useState } from 'react';
import { Box, Typography, Paper } from '@mui/material';
import './Riskometer.css';

const Riskometer = ({ issues }) => {
  const [riskScore, setRiskScore] = useState(0);

  useEffect(() => {
    const calculateRisk = () => {
      if (!issues || issues.length === 0) return 0;

      let score = 0;
      issues.forEach((issue) => {
        const status = issue.fields?.status?.name;
        const priority = issue.fields?.priority?.name?.toLowerCase() || 'none';

        if (status === 'Done') return;

        const priorityWeights = {
          'highest': 6,
          'high': 5,
          'medium': 3,
          'low': 2,
          'lowest': 1,
          'critical': 7,
          'blocker': 8,
          'none': 1,
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
    if (riskPercent > 75) return '#f44336'; // Red
    if (riskPercent > 40) return '#ff9800'; // Orange
    return '#4caf50'; // Green
  };

  return (
    <Paper elevation={3} sx={{ p: 3, mb: 3, textAlign: 'center' }}>
      <Typography variant="h6" gutterBottom>
        Risk-o-Meter
      </Typography>
      <Box className="gauge-container">
        <div className="gauge">
          <div className="gauge-arc"></div>
          <div
            className="gauge-needle"
            style={{
              transform: `rotate(${needleRotation}deg)`,
              transition: 'transform 1.5s ease-out',
            }}
          ></div>
          <div className="gauge-center"></div>
        </div>
        <Typography variant="h4" component="div" sx={{ mt: -5, color: getRiskColor() }}>
          {riskScore}
        </Typography>
        <Typography variant="caption" display="block">
          Risk Score
        </Typography>
      </Box>
    </Paper>
  );
};

export default Riskometer;
