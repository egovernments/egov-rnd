import { Container, Typography, Box, Paper, Button } from '@mui/material';
import { useAuth } from '../context/AuthContext';
import JiraTest from '../components/JiraTest';

function HelloWorld() {
  const { logout } = useAuth();

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
          <Button
            variant="contained"
            color="primary"
            onClick={logout}
            sx={{ mt: 2 }}
          >
            Logout
          </Button>
        </Paper>

        <JiraTest />
      </Box>
    </Container>
  );
}

export default HelloWorld;
