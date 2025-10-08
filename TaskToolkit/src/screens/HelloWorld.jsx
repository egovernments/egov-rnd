import { Container, Typography, Box, Paper, Button } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

function HelloWorld() {
  const { logout } = useAuth();
  const navigate = useNavigate();

  return (
    <Container maxWidth="lg">
      <Box
        sx={{
          minHeight: '100vh',
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'center',
          py: 4,
        }}
      >
        <Paper
          elevation={3}
          sx={{
            padding: 4,
            textAlign: 'center',
            borderRadius: 2,
            mb: 4,
          }}
        >
          <Typography variant="h2" component="h1" gutterBottom>
            Hello World
          </Typography>
          <Typography variant="body1" color="text.secondary" sx={{ mb: 2 }}>
            Welcome to TaskToolkit! You've successfully logged in.
          </Typography>
          <Box sx={{ display: 'flex', gap: 2, mt: 2, flexWrap: 'wrap', justifyContent: 'center' }}>
            <Button
              variant="contained"
              color="secondary"
              onClick={() => navigate('/jira-test')}
            >
              Test Jira
            </Button>
            <Button
              variant="contained"
              color="info"
              onClick={() => navigate('/campaign-details')}
            >
              Campaign Details
            </Button>
            <Button
              variant="contained"
              color="primary"
              onClick={logout}
            >
              Logout
            </Button>
          </Box>
        </Paper>
      </Box>
    </Container>
  );
}

export default HelloWorld;
