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
  Alert
} from '@mui/material';
import { getCampaigns } from '../services/jiraService';

function CampaignDetailPage() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [campaign, setCampaign] = useState(null);
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
        const response = await getCampaigns();
        const foundCampaign = response.issues?.find(issue => issue.id === id);
        if (foundCampaign) {
          setCampaign(foundCampaign);
        } else {
          setError('Campaign not found');
        }
      } catch (err) {
        setError(err.message || 'Failed to fetch campaign details');
        console.error('Error fetching campaign:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchCampaignDetail();
  }, [id]);

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

  if (!campaign) {
    return null;
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

        <Paper elevation={3} sx={{ p: 4 }}>
          <Box sx={{ mb: 4 }}>
            <Typography variant="h4" component="h1" gutterBottom>
              Campaign Details
            </Typography>
            <Typography variant="h6" color="text.secondary">
              {campaign.key}
            </Typography>
          </Box>

          <Grid container spacing={3}>
            <Grid item xs={12}>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                Summary
              </Typography>
              <Typography variant="body1" sx={{ fontSize: '1.1rem' }}>
                {campaign.fields?.summary || 'N/A'}
              </Typography>
            </Grid>

            <Grid item xs={12} sm={6}>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                Status
              </Typography>
              <Chip
                label={campaign.fields?.status?.name || 'Unknown'}
                color={getStatusColor(campaign.fields?.status?.name)}
                size="medium"
              />
            </Grid>

            <Grid item xs={12} sm={6}>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                Priority
              </Typography>
              <Typography variant="body1">
                {campaign.fields?.priority?.name || 'N/A'}
              </Typography>
            </Grid>

            <Grid item xs={12} sm={6}>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                Due Date
              </Typography>
              <Typography variant="body1">
                {campaign.fields?.duedate || 'Not set'}
              </Typography>
            </Grid>

            <Grid item xs={12} sm={6}>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                Assignee
              </Typography>
              <Typography variant="body1">
                {campaign.fields?.assignee?.displayName || 'Unassigned'}
              </Typography>
            </Grid>

            <Grid item xs={12}>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                Parent Epic
              </Typography>
              <Typography variant="body1">
                {campaign.fields?.parent?.fields?.summary || 'N/A'}
              </Typography>
            </Grid>

            <Grid item xs={12}>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                Project
              </Typography>
              <Typography variant="body1">
                {campaign.fields?.project?.name || 'N/A'}
              </Typography>
            </Grid>

            <Grid item xs={12}>
              <Typography variant="subtitle2" color="text.secondary" gutterBottom>
                Issue Link
              </Typography>
              <Typography variant="body2">
                <a
                  href={campaign.self}
                  target="_blank"
                  rel="noopener noreferrer"
                  style={{ color: '#1976d2', textDecoration: 'none' }}
                >
                  {campaign.self}
                </a>
              </Typography>
            </Grid>
          </Grid>
        </Paper>
      </Box>
    </Container>
  );
}

export default CampaignDetailPage;
