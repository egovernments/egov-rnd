import { Container, Typography, Box, Paper, Button, Divider } from '@mui/material';
import { GoogleLogin } from '@react-oauth/google';
import { useAuth } from '../context/AuthContext';
import { useNavigate } from 'react-router-dom';

function Login() {
  const { login } = useAuth();
  const navigate = useNavigate();

  const handleGoogleSuccess = (credentialResponse) => {
    login(credentialResponse);
    navigate('/');
  };

  const handleGoogleError = () => {
    console.error('Google Login Failed');
  };

  const handleDummyLogin = () => {
    login();
    navigate('/');
  };

  return (
    <Container maxWidth="sm">
      <Box
        sx={{
          minHeight: '100%',
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
          
          <Box sx={{ mb: 3 }}>
            <GoogleLogin
              onSuccess={handleGoogleSuccess}
              onError={handleGoogleError}
              size="large"
              width="100%"
              theme="outline"
              text="signin_with"
            />
          </Box>

          <Divider sx={{ my: 2 }}>
            <Typography variant="body2" color="text.secondary">
              OR
            </Typography>
          </Divider>

          <Button
            variant="outlined"
            color="primary"
            size="large"
            onClick={handleDummyLogin}
            fullWidth
          >
            Continue as Demo User
          </Button>
        </Paper>
      </Box>
    </Container>
  );
}

export default Login;
