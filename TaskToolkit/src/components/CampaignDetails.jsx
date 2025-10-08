import { useState, useMemo } from 'react';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Typography,
  Chip,
  Box,
  FormControl,
  InputLabel,
  Select,
  MenuItem,
  Grid
} from '@mui/material';
import dummyResponse from '../configs/dummyresponse.json';

const CampaignDetails = () => {
  const [campaigns] = useState(dummyResponse.issues || []);
  const [statusFilter, setStatusFilter] = useState('all');
  const [projectFilter, setProjectFilter] = useState('all');
  const [issueTypeFilter, setIssueTypeFilter] = useState('all');

  // Extract unique values for filters
  const uniqueStatuses = useMemo(() => {
    const statuses = campaigns.map(c => c.fields?.status?.name).filter(Boolean);
    return [...new Set(statuses)];
  }, [campaigns]);

  const uniqueProjects = useMemo(() => {
    const projects = campaigns.map(c => c.fields?.project?.name).filter(Boolean);
    return [...new Set(projects)];
  }, [campaigns]);

  const uniqueIssueTypes = useMemo(() => {
    const types = campaigns.map(c => c.fields?.issuetype?.name).filter(Boolean);
    return [...new Set(types)];
  }, [campaigns]);

  // Filter campaigns
  const filteredCampaigns = useMemo(() => {
    return campaigns.filter(campaign => {
      const matchesStatus = statusFilter === 'all' || campaign.fields?.status?.name === statusFilter;
      const matchesProject = projectFilter === 'all' || campaign.fields?.project?.name === projectFilter;
      const matchesIssueType = issueTypeFilter === 'all' || campaign.fields?.issuetype?.name === issueTypeFilter;
      return matchesStatus && matchesProject && matchesIssueType;
    });
  }, [campaigns, statusFilter, projectFilter, issueTypeFilter]);

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

  return (
    <Box sx={{ width: '100%', mt: 3 }}>
      <Typography variant="h5" component="h2" gutterBottom sx={{ mb: 3 }}>
        Campaign Details
      </Typography>

      {/* Filters */}
      <Paper elevation={2} sx={{ p: 3, mb: 3 }}>
        <Typography variant="h6" gutterBottom>
          Filters
        </Typography>
        <Grid container spacing={2}>
          <Grid item xs={12} sm={4}>
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
          <Grid item xs={12} sm={4}>
            <FormControl fullWidth>
              <InputLabel>Project</InputLabel>
              <Select
                value={projectFilter}
                label="Project"
                onChange={(e) => setProjectFilter(e.target.value)}
              >
                <MenuItem value="all">All Projects</MenuItem>
                {uniqueProjects.map(project => (
                  <MenuItem key={project} value={project}>{project}</MenuItem>
                ))}
              </Select>
            </FormControl>
          </Grid>
          <Grid item xs={12} sm={4}>
            <FormControl fullWidth>
              <InputLabel>Issue Type</InputLabel>
              <Select
                value={issueTypeFilter}
                label="Issue Type"
                onChange={(e) => setIssueTypeFilter(e.target.value)}
              >
                <MenuItem value="all">All Types</MenuItem>
                {uniqueIssueTypes.map(type => (
                  <MenuItem key={type} value={type}>{type}</MenuItem>
                ))}
              </Select>
            </FormControl>
          </Grid>
        </Grid>
      </Paper>

      <TableContainer component={Paper} elevation={3}>
        <Table sx={{ minWidth: 650 }} aria-label="campaign details table">
          <TableHead>
            <TableRow sx={{ backgroundColor: '#f5f5f5' }}>
              <TableCell sx={{ fontWeight: 'bold' }}>Key</TableCell>
              <TableCell sx={{ fontWeight: 'bold' }}>Campaign Name</TableCell>
              <TableCell sx={{ fontWeight: 'bold' }}>Status</TableCell>
              <TableCell sx={{ fontWeight: 'bold' }}>Assignee</TableCell>
              <TableCell sx={{ fontWeight: 'bold' }}>Project</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {filteredCampaigns.map((campaign) => (
              <TableRow
                key={campaign.id}
                sx={{ '&:last-child td, &:last-child th': { border: 0 }, '&:hover': { backgroundColor: '#f9f9f9' } }}
              >
                <TableCell component="th" scope="row">
                  {campaign.key}
                </TableCell>
                <TableCell>{campaign.fields?.summary || 'N/A'}</TableCell>
                <TableCell>
                  <Chip
                    label={campaign.fields?.status?.name || 'Unknown'}
                    color={getStatusColor(campaign.fields?.status?.name)}
                    size="small"
                  />
                </TableCell>
                <TableCell>{campaign.fields?.assignee?.displayName || 'Unassigned'}</TableCell>
                <TableCell>{campaign.fields?.project?.name || 'N/A'}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>

      <Typography variant="body2" color="text.secondary" sx={{ mt: 2 }}>
        Showing {filteredCampaigns.length} of {campaigns.length} campaigns
      </Typography>
    </Box>
  );
};

export default CampaignDetails;
