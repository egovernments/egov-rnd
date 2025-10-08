import { Box, List, ListItem, ListItemButton, ListItemIcon, ListItemText, Divider } from '@mui/material';
import { useTheme } from '@mui/material/styles';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';

// Custom SVG Icons
const HomeIcon = () => (
  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z" fill="white"/>
  </svg>
);

const LogoutIcon = () => (
  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M17 7l-1.41 1.41L18.17 11H8v2h10.17l-2.58 2.59L17 17l5-5zM4 5h8V3H4c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h8v-2H4V5z" fill="white"/>
  </svg>
);

function Sidebar() {
  const theme = useTheme();
  const navigate = useNavigate();
  const { logout } = useAuth();

  const handleHomeClick = () => {
    navigate('/');
  };

  const handleLogoutClick = () => {
    logout();
  };

  return (
    <Box
      sx={{
        width: 60,
        height: '100%',
        backgroundColor: theme.palette.secondary.main,
        borderRight: '1px solid #e0e0e0',
        display: 'flex',
        flexDirection: 'column'
      }}
    >
      <List sx={{ flexGrow: 1, pt: 2 }}>
        <ListItem disablePadding>
          <ListItemButton 
            onClick={handleHomeClick}
            sx={{ 
              minHeight: 48,
              justifyContent: 'center',
              px: 1
            }}
          >
            <ListItemIcon sx={{ minWidth: 0, justifyContent: 'center' }}>
              <HomeIcon />
            </ListItemIcon>
          </ListItemButton>
        </ListItem>
      </List>
      
      <Divider />
      
      <List sx={{ pb: 2 }}>
        <ListItem disablePadding>
          <ListItemButton 
            onClick={handleLogoutClick}
            sx={{ 
              minHeight: 48,
              justifyContent: 'center',
              px: 1
            }}
          >
            <ListItemIcon sx={{ minWidth: 0, justifyContent: 'center' }}>
              <LogoutIcon />
            </ListItemIcon>
          </ListItemButton>
        </ListItem>
      </List>
    </Box>
  );
}

export default Sidebar;