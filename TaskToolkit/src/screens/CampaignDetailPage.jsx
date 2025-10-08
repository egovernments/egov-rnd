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
  TextField
} from '@mui/material';
import { getCampaignDetailByEpicLink } from '../services/jiraService';

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
  const total = campaignData?.total || 0;

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
          sx={{ mb: 3 }}
        >
          <ArrowBackIcon />
          Back to Campaigns
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
                <TableCell sx={{ fontWeight: 'bold' }}>Due Date</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {filteredIssues.map((issue) => (
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
