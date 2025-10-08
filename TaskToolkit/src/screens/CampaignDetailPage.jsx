import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import {
  Container,
  Box,
  Button,
  Paper,
  Typography,
  Grid,
  Chip,
  CircularProgress,
  Alert,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow
} from '@mui/material';
import { getCampaignDetailByEpicLink } from '../services/jiraService';
import html2canvas from 'html2canvas';
import jsPDF from 'jspdf';

function CampaignDetailPage() {
  const { key } = useParams();
  const navigate = useNavigate();
  const [campaignData, setCampaignData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  // Simple Arrow Back icon using SVG
  const ArrowBackIcon = () => (
    <Box
      component="svg"
      sx={{ width: 20, height: 20, mr: 0.5 }}
      viewBox="0 0 24 24"
      fill="currentColor"
    >
      <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"/>
    </Box>
  );

  useEffect(() => {
    const fetchCampaignDetail = async () => {
      setLoading(true);
      setError(null);
      try {
        const response = await getCampaignDetailByEpicLink(key);
        if (response && response.issues) {
          setCampaignData(response);
        } else {
          setError('No campaign data found');
        }
      } catch (err) {
        setError(err.message || 'Failed to fetch campaign details');
        console.error('Error fetching campaign:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchCampaignDetail();
  }, [key]);

  const getStatusColor = (statusName) => {
    const statusColors = {
      'Backlog': 'default',
      'In Progress': 'primary',
      'Done': 'success',
      'To Do': 'info',
      'Review': 'warning'
    };
    return statusColors[statusName] || 'default';
  };

  // Function to download full page as PDF
  const downloadFullPagePDF = async () => {
    try {
      const element = document.body;
      const canvas = await html2canvas(element, { scrollY: -window.scrollY });
      const imgData = canvas.toDataURL('image/png');

      const pdf = new jsPDF('p', 'pt', 'a4');
      const pdfWidth = pdf.internal.pageSize.getWidth();
      const pdfHeight = (canvas.height * pdfWidth) / canvas.width;

      pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
      pdf.save(`campaign-${key}.pdf`);
    } catch (error) {
      console.error('PDF generation error:', error);
    }
  };

  if (loading) {
    return (
      <Container maxWidth="lg">
        <Box sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', minHeight: '100vh' }}>
          <CircularProgress />
        </Box>
      </Container>
    );
  }

  if (error) {
    return (
      <Container maxWidth="lg">
        <Box sx={{ py: 4 }}>
          <Button
            variant="outlined"
            onClick={() => navigate('/campaign-details')}
            sx={{ mb: 3 }}
          >
            <ArrowBackIcon />
            Back to Campaigns
          </Button>
          <Alert severity="error">{error}</Alert>
        </Box>
      </Container>
    );
  }

  if (!campaignData) {
    return null;
  }

  const { issues = [], total = 0 } = campaignData;

  return (
    <Container maxWidth="lg">
      <Box sx={{ minHeight: '100vh', py: 4 }}>
        <Button
          variant="outlined"
          onClick={() => navigate('/campaign-details')}
          sx={{ mb: 3, mr: 2 }}
        >
          <ArrowBackIcon />
          Back to Campaigns
        </Button>

        {/* Elevated button for PDF download */}
        <Button
          variant="contained"
          color="primary"
          onClick={downloadFullPagePDF}
          sx={{ mb: 3 }}
        >
          Download Full Page PDF
        </Button>

        <Paper elevation={3} sx={{ p: 4, mb: 3 }}>
          <Box sx={{ mb: 4 }}>
            <Typography variant="h4" component="h1" gutterBottom>
              Campaign Details
            </Typography>
            <Typography variant="h6" color="text.secondary">
              Epic: {key}
            </Typography>
            <Typography variant="body2" color="text.secondary" sx={{ mt: 1 }}>
              Total Issues: {total}
            </Typography>
          </Box>
        </Paper>

        <TableContainer component={Paper} elevation={3}>
          <Table>
            <TableHead>
              <TableRow sx={{ backgroundColor: '#f5f5f5' }}>
                <TableCell sx={{ fontWeight: 'bold' }}>Key</TableCell>
                <TableCell sx={{ fontWeight: 'bold' }}>Summary</TableCell>
                <TableCell sx={{ fontWeight: 'bold' }}>Status</TableCell>
                <TableCell sx={{ fontWeight: 'bold' }}>Priority</TableCell>
                <TableCell sx={{ fontWeight: 'bold' }}>Assignee</TableCell>
                <TableCell sx={{ fontWeight: 'bold' }}>Due Date</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {issues.map((issue) => (
                <TableRow
                  key={issue.id}
                  sx={{ '&:hover': { backgroundColor: '#f9f9f9' } }}
                >
                  <TableCell>{issue.key}</TableCell>
                  <TableCell>{issue.fields?.summary || 'N/A'}</TableCell>
                  <TableCell>
                    <Chip
                      label={issue.fields?.status?.name || 'Unknown'}
                      color={getStatusColor(issue.fields?.status?.name)}
                      size="small"
                    />
                  </TableCell>
                  <TableCell>{issue.fields?.priority?.name || 'N/A'}</TableCell>
                  <TableCell>{issue.fields?.assignee?.displayName || 'Unassigned'}</TableCell>
                  <TableCell>{issue.fields?.duedate || 'Not set'}</TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </TableContainer>

        {issues.length === 0 && (
          <Alert severity="info" sx={{ mt: 3 }}>
            No issues found for this epic.
          </Alert>
        )}
      </Box>
    </Container>
  );
}

export default CampaignDetailPage;
