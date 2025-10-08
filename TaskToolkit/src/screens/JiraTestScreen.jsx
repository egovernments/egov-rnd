import { Container, Box, Button } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import JiraTest from '../components/JiraTest';

function JiraTestScreen() {
  const navigate = useNavigate();

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
          startIcon={<ArrowBackIcon />}
          onClick={() => navigate('/')}
          sx={{ mb: 3 }}
        >
          Back to Home
        </Button>

        <JiraTest />
      </Box>
    </Container>
  );
}

export default JiraTestScreen;
