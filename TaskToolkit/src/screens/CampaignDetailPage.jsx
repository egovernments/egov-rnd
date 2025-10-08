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

  const issues = campaignData?.issues || [];
  const total = campaignData?.total || issues.length;

  // Extract unique values for filters - must be at top level before any returns
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

  // Filter issues
  const filteredIssues = useMemo(() => {
    return issues.filter(issue => {
      const matchesStatus = statusFilter === 'all' || issue.fields?.status?.name === statusFilter;
      const matchesAssignee = assigneeFilter === 'all' || issue.fields?.assignee?.displayName === assigneeFilter;
      const matchesPriority = priorityFilter === 'all' || issue.fields?.priority?.name === priorityFilter;
      const matchesKey = !keyFilter || issue.key?.toLowerCase().includes(keyFilter.toLowerCase());
      return matchesStatus && matchesAssignee && matchesPriority && matchesKey;
    });
  }, [issues, statusFilter, assigneeFilter, priorityFilter, keyFilter]);

  // Prepare data for pie charts
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

  // Better color palettes for each chart
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
    e.stopPropagation(); // Prevent row click
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

        <Riskometer issues={issues} />
        {/* Analytics Charts */}
        <Paper elevation={3} sx={{ p: 4, mb: 3 }}>
          <Typography variant="h5" gutterBottom sx={{ mb: 3 }}>
            Task Analytics
          </Typography>
          <Box sx={{ display: 'flex', flexDirection: { xs: 'column', md: 'row' }, gap: 3 }}>
            <Box sx={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
              <Typography variant="h6" gutterBottom>
                Status Distribution
              </Typography>
              <Box sx={{ width: '100%', height: 300 }}>
                <ResponsiveContainer>
                  <PieChart>
                    <Pie
                      data={statusChartData}
                      cx="50%"
                      cy="45%"
                      labelLine={false}
                      label={({ percent }) => `${(percent * 100).toFixed(0)}%`}
                      outerRadius="60%"
                      innerRadius={0}
                      paddingAngle={2}
                      fill="#8884d8"
                      dataKey="value"
                      animationBegin={0}
                      animationDuration={800}
                    >
                      {statusChartData.map((entry, index) => (
                        <Cell key={`cell-${index}`} fill={STATUS_COLORS[index % STATUS_COLORS.length]} />
                      ))}
                    </Pie>
                    <Tooltip />
                    <Legend
                      verticalAlign="bottom"
                      height={36}
                      wrapperStyle={{ fontSize: '11px' }}
                    />
                  </PieChart>
                </ResponsiveContainer>
              </Box>
            </Box>
            <Box sx={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
              <Typography variant="h6" gutterBottom>
                Assignee Distribution
              </Typography>
              <Box sx={{ width: '100%', height: 300 }}>
                <ResponsiveContainer>
                  <PieChart>
                    <Pie
                      data={assigneeChartData}
                      cx="50%"
                      cy="45%"
                      labelLine={false}
                      label={({ percent }) => `${(percent * 100).toFixed(0)}%`}
                      outerRadius="60%"
                      innerRadius={0}
                      paddingAngle={2}
                      fill="#8884d8"
                      dataKey="value"
                      animationBegin={0}
                      animationDuration={800}
                    >
                      {assigneeChartData.map((entry, index) => (
                        <Cell key={`cell-${index}`} fill={ASSIGNEE_COLORS[index % ASSIGNEE_COLORS.length]} />
                      ))}
                    </Pie>
                    <Tooltip />
                    <Legend
                      verticalAlign="bottom"
                      height={36}
                      wrapperStyle={{ fontSize: '11px' }}
                    />
                  </PieChart>
                </ResponsiveContainer>
              </Box>
            </Box>
            <Box sx={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
              <Typography variant="h6" gutterBottom>
                Priority Distribution
              </Typography>
              <Box sx={{ width: '100%', height: 300 }}>
                <ResponsiveContainer>
                  <PieChart>
                    <Pie
                      data={priorityChartData}
                      cx="50%"
                      cy="45%"
                      labelLine={false}
                      label={({ percent }) => `${(percent * 100).toFixed(0)}%`}
                      outerRadius="60%"
                      innerRadius={0}
                      paddingAngle={2}
                      fill="#8884d8"
                      dataKey="value"
                      animationBegin={0}
                      animationDuration={800}
                    >
                      {priorityChartData.map((entry, index) => (
                        <Cell key={`cell-${index}`} fill={PRIORITY_COLORS[index % PRIORITY_COLORS.length]} />
                      ))}
                    </Pie>
                    <Tooltip />
                    <Legend
                      verticalAlign="bottom"
                      height={36}
                      wrapperStyle={{ fontSize: '11px' }}
                    />
                  </PieChart>
                </ResponsiveContainer>
              </Box>
            </Box>
          </Box>
        </Paper>

        {/* Filters */}
        <Paper elevation={2} sx={{ p: 3, mb: 3 }}>
          <Typography variant="h6" gutterBottom>
            Filters
          </Typography>
          <Grid container spacing={2}>
            <Grid item xs={12} sm={6} md={3}>
              <FormControl fullWidth>
                <InputLabel>Status</InputLabel>
                <Select
                  value={statusFilter}
                  label="Status"
                  onChange={(e) => setStatusFilter(e.target.value)}
                >
                  <MenuItem value="all">All Statuses</MenuItem>
                  {uniqueStatuses.map(status => (
                    <MenuItem key={status} value={status}>{status}</MenuItem>
                  ))}
                </Select>
              </FormControl>
            </Grid>
            <Grid item xs={12} sm={6} md={3}>
              <FormControl fullWidth>
                <InputLabel>Assignee</InputLabel>
                <Select
                  value={assigneeFilter}
                  label="Assignee"
                  onChange={(e) => setAssigneeFilter(e.target.value)}
                >
                  <MenuItem value="all">All Assignees</MenuItem>
                  {uniqueAssignees.map(assignee => (
                    <MenuItem key={assignee} value={assignee}>{assignee}</MenuItem>
                  ))}
                </Select>
              </FormControl>
            </Grid>
            <Grid item xs={12} sm={6} md={3}>
              <FormControl fullWidth>
                <InputLabel>Priority</InputLabel>
                <Select
                  value={priorityFilter}
                  label="Priority"
                  onChange={(e) => setPriorityFilter(e.target.value)}
                >
                  <MenuItem value="all">All Priorities</MenuItem>
                  {uniquePriorities.map(priority => (
                    <MenuItem key={priority} value={priority}>{priority}</MenuItem>
                  ))}
                </Select>
              </FormControl>
            </Grid>
            <Grid item xs={12} sm={6} md={3}>
              <TextField
                fullWidth
                label="Key"
                variant="outlined"
                value={keyFilter}
                onChange={(e) => setKeyFilter(e.target.value)}
                placeholder="Search by key..."
              />
            </Grid>
          </Grid>
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
                <TableCell sx={{ fontWeight: 'bold' }}>Start Date</TableCell>
                <TableCell sx={{ fontWeight: 'bold' }}>End Date</TableCell>
                <TableCell sx={{ fontWeight: 'bold' }}>Duration</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {filteredIssues.map((issue) => {
                const startDate = issue.fields?.customfield_10015;
                const endDate = issue.fields?.customfield_10069;
                return (
                  <TableRow
                    key={issue.id}
                    sx={{ '&:hover': { backgroundColor: '#f9f9f9' } }}
                  >
                    <TableCell>
                    <Link
                      component="button"
                      variant="body2"
                      onClick={(e) => handleKeyClick(e, issue.key)}
                      sx={{
                        cursor: 'pointer',
                        textDecoration: 'none',
                        color: 'primary.main',
                        '&:hover': {
                          textDecoration: 'underline'
                        }
                      }}
                    >
                      {issue.key}
                    </Link>
                  </TableCell>
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
                    <TableCell>{formatDate(startDate)}</TableCell>
                    <TableCell>{formatDate(endDate)}</TableCell>
                    <TableCell>{calculateDueDate(startDate, endDate)}</TableCell>
                  </TableRow>
                );
              })}
            </TableBody>
          </Table>
        </TableContainer>

        {issues.length === 0 ? (
          <Alert severity="info" sx={{ mt: 3 }}>
            No issues found for this epic.
          </Alert>
        ) : filteredIssues.length === 0 ? (
          <Alert severity="info" sx={{ mt: 3 }}>
            No issues match the current filters.
          </Alert>
        ) : (
          <Typography variant="body2" color="text.secondary" sx={{ mt: 2 }}>
            Showing {filteredIssues.length} of {issues.length} issues
          </Typography>
        )}
      </Box>
    </Container>
  );
}

export default CampaignDetailPage;
