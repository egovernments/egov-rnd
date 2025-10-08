import { Box } from '@mui/material';
import AppBar from './AppBar';
import Sidebar from './Sidebar';

function Layout({ children }) {
  return (
    <Box sx={{ 
      display: 'flex', 
      flexDirection: 'column', 
      minHeight: '100vh',
      margin: 0,
      padding: 0,
      width: '100%'
    }}>
      <AppBar />
      <Box sx={{ display: 'flex', flexGrow: 1, height: 'calc(100vh - 100px)' }}>
        <Sidebar />
        <Box component="main" sx={{ flexGrow: 1, padding: 2, overflow: 'auto' }}>
          {children}
        </Box>
      </Box>
      <Box
        component="footer"
        sx={{
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
          width: '100%'
        }}
      >
        <Box
          component="img"
          src="https://egov-uat-assets.s3.ap-south-1.amazonaws.com/digit-footer.png"
          alt="Powered by Digit"
          sx={{
            height: 20,
            width: 'auto'
          }}
        />
      </Box>
    </Box>
  );
}

export default Layout;