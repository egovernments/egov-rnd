import { createTheme } from '@mui/material/styles';

const theme = createTheme({
  palette: {
    primary: {
      main: '#c84c0e', // Primary color from design system
      light: '#d66d3a', // Lighter variant of #c84c0e
      dark: '#a13d0b', // Darker variant of #c84c0e
      contrastText: '#FFFFFF',
    },
    secondary: {
      main: 'rgb(11, 75, 102)', // Header Sidenav color
      light: '#4A7A94',
      dark: '#052F42',
      contrastText: '#FFFFFF',
    },
    background: {
      default: '#EEEEEE', // Background color
      paper: '#FFFFFF', // Card Primary color
    },
    text: {
      primary: '#000C0C', // Primary Text, Icons
      secondary: '#505A5F', // Secondary Text
      disabled: '#B1B4B6', // Text Disabled
    },
    divider: '#D6D5D4', // Divider color
    success: {
      main: '#00703C', // Alert / Success
      light: '#4A9C6A',
      dark: '#004D28',
      contrastText: '#FFFFFF',
    },
    error: {
      main: '#D4351C', // Alert / Error
      light: '#E56F5A',
      dark: '#A32612',
      contrastText: '#FFFFFF',
    },
    warning: {
      main: '#FBC02D', // Chart 2
      light: '#FFEB3B',
      dark: '#F57F17',
      contrastText: '#000000',
    },
    info: {
      main: '#3490DB', // Alert / Info
      light: '#64B5F6',
      dark: '#1976D2',
      contrastText: '#FFFFFF',
    },
  },
  typography: {
    fontFamily: 'system-ui, Avenir, Helvetica, Arial, sans-serif',
    h1: {
      fontSize: '2.5rem',
      fontWeight: 600,
      lineHeight: 1.2,
    },
    h2: {
      fontSize: '2rem',
      fontWeight: 600,
      lineHeight: 1.3,
    },
    h3: {
      fontSize: '1.75rem',
      fontWeight: 600,
      lineHeight: 1.3,
    },
    h4: {
      fontSize: '1.5rem',
      fontWeight: 600,
      lineHeight: 1.4,
    },
    h5: {
      fontSize: '1.25rem',
      fontWeight: 600,
      lineHeight: 1.4,
    },
    h6: {
      fontSize: '1rem',
      fontWeight: 600,
      lineHeight: 1.5,
    },
    body1: {
      fontSize: '1rem',
      lineHeight: 1.5,
    },
    body2: {
      fontSize: '0.875rem',
      lineHeight: 1.43,
    },
  },
  shape: {
    borderRadius: 8,
  },
  spacing: 8,
  components: {
    MuiButton: {
      styleOverrides: {
        root: {
          textTransform: 'none',
          borderRadius: 8,
          fontWeight: 500,
          padding: '12px 24px',
        },
        contained: {
          boxShadow: 'none',
          '&:hover': {
            boxShadow: '0 2px 4px rgba(0,0,0,0.1)',
          },
        },
      },
    },
    MuiPaper: {
      styleOverrides: {
        root: {
          borderRadius: 12,
        },
      },
    },
    MuiCard: {
      styleOverrides: {
        root: {
          borderRadius: 12,
          boxShadow: '0 2px 8px rgba(0,0,0,0.1)',
        },
      },
    },
    MuiTextField: {
      styleOverrides: {
        root: {
          '& .MuiOutlinedInput-root': {
            borderRadius: 8,
            '& fieldset': {
              borderColor: '#D6D5D4',
            },
            '&:hover fieldset': {
              borderColor: '#505A5F',
            },
            '&.Mui-focused fieldset': {
              borderColor: '#c84c0e',
            },
          },
        },
      },
    },
  },
});

export default theme;