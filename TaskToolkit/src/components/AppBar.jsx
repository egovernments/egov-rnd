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
    <MuiAppBar 
      position="static" 
      sx={{
        margin: 0,
        marginTop: 0,
        padding: 0,
        paddingTop: 0,
        width: '100%',
        borderRadius: '0 !important',
        boxShadow: 2,
        backgroundColor: 'white',
        '& .MuiToolbar-root': {
          borderRadius: '0 !important'
        },
        '&.MuiAppBar-root': {
          borderRadius: '0 !important'
        }
      }}
    >
      <Toolbar sx={{ 
        minHeight: '64px !important',
        paddingLeft: '16px !important',
        paddingRight: '16px !important',
        paddingTop: '0 !important',
        margin: 0,
        marginTop: 0
      }}>
        <Typography variant="h6" component="div" sx={{ flexGrow: 1, color: '#333' }}>
          Smart Campaign Manager Toolkit
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
                <Typography variant="body2" sx={{ color: '#333', lineHeight: 1.2 }}>
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
          <Box
            component="img"
            src="https://moz-health-prd.s3.af-south-1.amazonaws.com/dashboard-assets/digit-logo.png"
            alt="Digit Logo"
            sx={{
              height: 40,
              width: 'auto',
              ml: 2
            }}
          />
        </Box>
      </Toolbar>
    </MuiAppBar>
  );
}

export default AppBar;