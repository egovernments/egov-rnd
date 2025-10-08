import { AppBar as MuiAppBar, Toolbar, Typography, Button, Box, Avatar } from '@mui/material';
import { useAuth } from '../context/AuthContext';

function AppBar() {
  const { logout, user } = useAuth();

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
              <Typography variant="body2" sx={{ color: 'inherit' }}>
                Welcome, {user.name || 'User'}
              </Typography>
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