import { useState, useMemo, useEffect, useCallback } from 'react';
import { useNavigate } from 'react-router-dom';
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
  Grid,
  CircularProgress,
  Alert,
  TextField
} from '@mui/material';
import { getCampaigns } from '../services/jiraService';

const CampaignDetails = () => {
  const navigate = useNavigate();
  const [campaigns, setCampaigns] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);
  const [statusFilter, setStatusFilter] = useState('all');
  const [epicFilter, setEpicFilter] = useState('all');
  const [debouncedCampaignName, setDebouncedCampaignName] = useState('');

  useEffect(() => {
    const fetchCampaigns = async () => {
      setLoading(true);
      setError(null);
      try {
        const response = await getCampaigns();
        setCampaigns(response.issues || []);
      } catch (err) {
        setError(err.message || 'Failed to fetch campaigns');
        console.error('Error fetching campaigns:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchCampaigns();
  }, []);

  // Debounced handler for campaign name input
  const handleCampaignNameChange = useCallback((e) => {
    const value = e.target.value;

    // Clear existing timer
    if (handleCampaignNameChange.timer) {
      clearTimeout(handleCampaignNameChange.timer);
    }

    // Set new timer
    handleCampaignNameChange.timer = setTimeout(() => {
      setDebouncedCampaignName(value);
    }, 500);
  }, []);

  // Extract unique values for filters
  const uniqueStatuses = useMemo(() => {
    const statuses = campaigns.map(c => c.fields?.status?.name).filter(Boolean);
    return [...new Set(statuses)];
  }, [campaigns]);

  const uniqueEpics = useMemo(() => {
    const epics = campaigns.map(c => c.fields?.parent?.fields?.summary).filter(Boolean);
    return [...new Set(epics)];
  }, [campaigns]);

  // Filter campaigns
  const filteredCampaigns = useMemo(() => {
    return campaigns.filter(campaign => {
      const matchesStatus = statusFilter === 'all' || campaign.fields?.status?.name === statusFilter;
      const matchesEpic = epicFilter === 'all' || campaign.fields?.parent?.fields?.summary === epicFilter;
      const matchesCampaignName = !debouncedCampaignName ||
        campaign.fields?.summary?.toLowerCase().includes(debouncedCampaignName.toLowerCase());
      return matchesStatus && matchesEpic && matchesCampaignName;
    });
  }, [campaigns, statusFilter, epicFilter, debouncedCampaignName]);

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

  const handleRowClick = (campaign) => {
    navigate(`/campaign/${campaign.id}`);
  };

  return (
    <Box sx={{ width: '100%', mt: 3 }}>
      <Typography variant="h5" component="h2" gutterBottom sx={{ mb: 3 }}>
        Campaign Details
      </Typography>

      {loading && (
        <Box sx={{ display: 'flex', justifyContent: 'center', my: 4 }}>
          <CircularProgress />
        </Box>
      )}

      {error && (
        <Alert severity="error" sx={{ mb: 3 }}>
          {error}
        </Alert>
      )}

      {!loading && !error && (
        <>
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
              <InputLabel>Epic</InputLabel>
              <Select
                value={epicFilter}
                label="Epic"
                onChange={(e) => setEpicFilter(e.target.value)}
              >
                <MenuItem value="all">All Epics</MenuItem>
                {uniqueEpics.map(epic => (
                  <MenuItem key={epic} value={epic}>{epic}</MenuItem>
                ))}
              </Select>
            </FormControl>
          </Grid>
          <Grid item xs={12} sm={4}>
            <TextField
              fullWidth
              label="Campaign Name"
              variant="outlined"
              onChange={handleCampaignNameChange}
              placeholder="Search by name..."
            />
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
                onClick={() => handleRowClick(campaign)}
                sx={{
                  '&:last-child td, &:last-child th': { border: 0 },
                  '&:hover': { backgroundColor: '#f0f7ff', cursor: 'pointer' },
                  transition: 'background-color 0.2s'
                }}
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
        </>
      )}
    </Box>
  );
};

export default CampaignDetails;
