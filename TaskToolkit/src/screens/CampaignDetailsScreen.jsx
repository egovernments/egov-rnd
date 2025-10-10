import { Container, Typography, Box, Button } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import CampaignDetails from '../components/CampaignDetails';

function CampaignDetailsScreen() {
  const navigate = useNavigate();

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

  return (
    <Container maxWidth="lg">
      <Box
        sx={{
          minHeight: '100vh',
          py: 4,
        }}
      >
        <Button
          variant="outlined"
          onClick={() => navigate('/')}
          sx={{ mb: 3 }}
        >
          <ArrowBackIcon />
          Back to Home
        </Button>

        <CampaignDetails />
      </Box>
    </Container>
  );
}

export default CampaignDetailsScreen;
