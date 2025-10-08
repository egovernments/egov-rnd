import { AppBar as MuiAppBar, Toolbar, Typography, Button, Box, Avatar, Chip } from '@mui/material';
import { useAuth } from '../context/AuthContext';

function AppBar() {
  const { logout, user } = useAuth();

  const getProviderColor = (provider) => {
    switch (provider) {
      case 'google': return '#4285f4';
      case 'github': return '#24292e';
      case 'demo': return '#9e9e9e';
      default: return '#9e9e9e';
    }
  };

  const getProviderLabel = (provider) => {
    switch (provider) {
      case 'google': return 'Google';
      case 'github': return 'GitHub';
      case 'demo': return 'Demo';
      default: return 'User';
    }
  };

  return (
    <MuiAppBar position="static" color="primary">
      <Toolbar>
        <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
          TaskToolkit
        </Typography>
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 2 }}>
          {user && (
            <>
              {user.picture && (
                <Avatar 
                  src={user.picture} 
                  alt={user.name}
                  sx={{ width: 32, height: 32 }}
                />
              )}
              <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: 'flex-end' }}>
                <Typography variant="body2" sx={{ color: 'inherit', lineHeight: 1.2 }}>
                  {user.name || 'User'}
                </Typography>
                {user.provider && (
                  <Chip
                    label={getProviderLabel(user.provider)}
                    size="small"
                    sx={{
                      backgroundColor: getProviderColor(user.provider),
                      color: 'white',
                      fontSize: '0.7rem',
                      height: '16px',
                      mt: 0.5
                    }}
                  />
                )}
              </Box>
            </>
          )}
          <Button 
            color="inherit" 
            onClick={logout}
            variant="outlined"
            sx={{ 
              borderColor: 'rgba(255, 255, 255, 0.5)',
              '&:hover': {
                borderColor: 'white',
                backgroundColor: 'rgba(255, 255, 255, 0.1)'
              }
            }}
          >
            Logout
          </Button>
        </Box>
      </Toolbar>
    </MuiAppBar>
  );
}

export default AppBar;