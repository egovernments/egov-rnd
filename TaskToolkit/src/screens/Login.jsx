import { Container, Typography, Box, Paper, Button, Divider } from '@mui/material';
import { GoogleLogin } from '@react-oauth/google';
import { useAuth } from '../context/AuthContext';
import { useNavigate } from 'react-router-dom';
import GitHubLogin from '../components/GitHubLogin';
import { useEffect } from 'react';

function Login() {
  const { login } = useAuth();
  const navigate = useNavigate();

  // Handle GitHub OAuth callback
  useEffect(() => {
    const urlParams = new URLSearchParams(window.location.search);
    const code = urlParams.get('code');
    
    if (code) {
      handleGitHubCallback(code);
    }
  }, []);

  const handleGoogleSuccess = (credentialResponse) => {
    login(credentialResponse, 'google');
    navigate('/');
  };

  const handleGoogleError = () => {
    console.error('Google Login Failed');
  };

  const handleGitHubCallback = async (code) => {
    try {
      // In a real app, you'd exchange the code for an access token on your backend
      // For demo purposes, we'll simulate getting user data
      const userData = {
        type: 'github',
        code: code,
        name: 'GitHub User',
        email: 'github@example.com',
        avatar_url: 'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png'
      };
      
      login(userData, 'github');
      navigate('/');
    } catch (error) {
      console.error('GitHub login failed:', error);
    }
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
            Welcome to HCM Campaign Tracking
          </Typography>
          <Typography variant="body1" color="text.secondary" sx={{ mb: 3 }}>
            Please sign in to continue
          </Typography>
          
          <Box sx={{ display: 'flex', flexDirection: 'column', gap: 2, mb: 3 }}>
            <GoogleLogin
              onSuccess={handleGoogleSuccess}
              onError={handleGoogleError}
              size="large"
              width="100%"
              theme="outline"
              text="signin_with"
            />
            
            <GitHubLogin />
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
