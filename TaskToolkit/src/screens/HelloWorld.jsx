import { Container, Typography, Box, Paper } from '@mui/material';

function HelloWorld() {
  return (
    <Container maxWidth="md">
      <Box
        sx={{
          minHeight: '100%',
          display: 'flex',
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
          }}
        >
          <Typography variant="h2" component="h1" gutterBottom>
            Hello World
          </Typography>
          <Typography variant="body1" color="text.secondary" sx={{ mb: 2 }}>
            Welcome to TaskToolkit! You've successfully logged in.
          </Typography>
          <Typography variant="body2" color="text.secondary">
            The logout button is now in the top navigation bar.
          </Typography>
        </Paper>
      </Box>
    </Container>
  );
}

export default HelloWorld;
