import { Container, Typography, Box, Paper, Button } from '@mui/material';
import { useAuth } from '../context/AuthContext';

function Login() {
  const { login } = useAuth();

  const handleDummyLogin = () => {
    const dummyCredential = {
      credential: 'dummy-token-12345',
      user: {
        name: 'Test User',
        email: 'test@example.com'
      }
    };
    login(dummyCredential);
  };

  return (
    <Container maxWidth="sm">
      <Box
        sx={{
          minHeight: '100vh',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
        }}
      >
        <Paper
          elevation={3}
          sx={{
            padding: 4,
            textAlign: 'center',
            borderRadius: 2,
            width: '100%',
          }}
        >
          <Typography variant="h4" component="h1" gutterBottom>
            Welcome to TaskToolkit
          </Typography>
          <Typography variant="body1" color="text.secondary" sx={{ mb: 3 }}>
            Please sign in to continue
          </Typography>
          <Button
            variant="contained"
            color="primary"
            size="large"
            onClick={handleDummyLogin}
            fullWidth
            sx={{ mt: 2 }}
          >
            Login
          </Button>
        </Paper>
      </Box>
    </Container>
  );
}

export default Login;
