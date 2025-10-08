import { useEffect, useState, useMemo } from 'react';
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
  TableRow,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  TextField,
  Link
} from '@mui/material';
import { PieChart, Pie, Cell, ResponsiveContainer, Legend, Tooltip } from 'recharts';
import { getCampaignDetailByEpicLink } from '../services/jiraService';
import html2canvas from 'html2canvas';
import jsPDF from 'jspdf';
import Riskometer from '../components/Riskometer';

function CampaignDetailPage() {
  const { key } = useParams();
  const navigate = useNavigate();
  const [campaignData, setCampaignData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [statusFilter, setStatusFilter] = useState('all');
  const [assigneeFilter, setAssigneeFilter] = useState('all');
  const [priorityFilter, setPriorityFilter] = useState('all');
  const [keyFilter, setKeyFilter] = useState('');

  const ArrowBackIcon = () => (
    <Box
      component="svg"
      sx={{ width: 20, height: 20, mr: 0.5 }}
      viewBox="0 0 24 24"
      fill="currentColor"
    >
      <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z" />
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

  const issues = campaignData?.issues || [];
  const total = campaignData?.total || issues.length;

  const uniqueStatuses = useMemo(() => {
    const statuses = issues.map(issue => issue.fields?.status?.name).filter(Boolean);
    return [...new Set(statuses)];
  }, [issues]);

  const uniqueAssignees = useMemo(() => {
    const assignees = issues.map(issue => issue.fields?.assignee?.displayName).filter(Boolean);
    return [...new Set(assignees)];
  }, [issues]);

  const uniquePriorities = useMemo(() => {
    const priorities = issues.map(issue => issue.fields?.priority?.name).filter(Boolean);
    return [...new Set(priorities)];
  }, [issues]);

  const filteredIssues = useMemo(() => {
    return issues.filter(issue => {
      const matchesStatus = statusFilter === 'all' || issue.fields?.status?.name === statusFilter;
      const matchesAssignee =
        assigneeFilter === 'all' || issue.fields?.assignee?.displayName === assigneeFilter;
      const matchesPriority =
        priorityFilter === 'all' || issue.fields?.priority?.name === priorityFilter;
      const matchesKey = !keyFilter || issue.key?.toLowerCase().includes(keyFilter.toLowerCase());
      return matchesStatus && matchesAssignee && matchesPriority && matchesKey;
    });
  }, [issues, statusFilter, assigneeFilter, priorityFilter, keyFilter]);

  const statusChartData = useMemo(() => {
    const statusCount = {};
    issues.forEach(issue => {
      const status = issue.fields?.status?.name || 'Unknown';
      statusCount[status] = (statusCount[status] || 0) + 1;
    });
    return Object.entries(statusCount).map(([name, value]) => ({ name, value }));
  }, [issues]);

  const assigneeChartData = useMemo(() => {
    const assigneeCount = {};
    issues.forEach(issue => {
      const assignee = issue.fields?.assignee?.displayName || 'Unassigned';
      assigneeCount[assignee] = (assigneeCount[assignee] || 0) + 1;
    });
    return Object.entries(assigneeCount).map(([name, value]) => ({ name, value }));
  }, [issues]);

  const priorityChartData = useMemo(() => {
    const priorityCount = {};
    issues.forEach(issue => {
      const priority = issue.fields?.priority?.name || 'None';
      priorityCount[priority] = (priorityCount[priority] || 0) + 1;
    });
    return Object.entries(priorityCount).map(([name, value]) => ({ name, value }));
  }, [issues]);

  const STATUS_COLORS = ['#4CAF50', '#2196F3', '#FF9800', '#F44336', '#9C27B0', '#00BCD4', '#FFEB3B', '#795548'];
  const ASSIGNEE_COLORS = ['#3F51B5', '#E91E63', '#009688', '#FF5722', '#607D8B', '#8BC34A', '#FFC107', '#673AB7'];
  const PRIORITY_COLORS = ['#F44336', '#FF9800', '#FFC107', '#4CAF50', '#2196F3', '#9E9E9E', '#00BCD4', '#8BC34A'];

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

  const handleKeyClick = (e, campaignKey) => {
    e.stopPropagation();
    window.open(`https://digit-discuss.atlassian.net/browse/${campaignKey}`, '_blank');
  };

  const formatDate = (dateString) => {
    if (!dateString) return 'Not set';
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
  };

  const calculateDueDate = (startDate, endDate) => {
    if (!startDate || !endDate) return 'N/A';
    const start = new Date(startDate);
    const end = new Date(endDate);
    const diffTime = Math.abs(end - start);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    return `${diffDays} days`;
  };

  // ✅ Updated function to download full scrollable page as PDF
  const downloadFullPagePDF = async () => {
    try {
      window.scrollTo(0, 0);
      const element = document.body;
      const totalHeight = element.scrollHeight;
      const totalWidth = element.scrollWidth;

      const canvas = await html2canvas(element, {
        width: totalWidth,
        height: totalHeight,
        windowWidth: totalWidth,
        windowHeight: totalHeight,
        scrollX: 0,
        scrollY: 0,
        useCORS: true,
        scale: 2
      });

      const imgData = canvas.toDataURL('image/png');
      const pdf = new jsPDF('p', 'pt', 'a4');
      const pdfWidth = pdf.internal.pageSize.getWidth();
      const pdfHeight = pdf.internal.pageSize.getHeight();
      const imgHeight = (canvas.height * pdfWidth) / canvas.width;

      let heightLeft = imgHeight;
      let position = 0;

      pdf.addImage(imgData, 'PNG', 0, position, pdfWidth, imgHeight);
      heightLeft -= pdfHeight;

      while (heightLeft > 0) {
        position = heightLeft - imgHeight;
        pdf.addPage();
        pdf.addImage(imgData, 'PNG', 0, position, pdfWidth, imgHeight);
        heightLeft -= pdfHeight;
      }

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
          <Button variant="outlined" onClick={() => navigate('/campaign-details')} sx={{ mb: 3 }}>
            <ArrowBackIcon />
            Back to Campaigns
          </Button>
          <Alert severity="error">{error}</Alert>
        </Box>
      </Container>
    );
  }

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

        <Riskometer issues={issues} />

        {/* Charts, Filters, and Table remain unchanged */}
        {/* ... your remaining JSX content ... */}
      </Box>
    </Container>
  );
}

export default CampaignDetailPage;
