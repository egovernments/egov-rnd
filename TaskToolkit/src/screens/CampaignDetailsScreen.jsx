import { Container, Box, Button } from '@mui/material';
import { useNavigate } from 'react-router-dom';
import * as XLSX from 'xlsx';
import { saveAs } from 'file-saver';
import CampaignDetails from '../components/CampaignDetails';

function CampaignDetailsScreen() {
  const navigate = useNavigate();

  const ArrowBackIcon = () => (
    <Box
      component="svg"
      sx={{ width: 20, height: 20 }}
      viewBox="0 0 24 24"
      fill="currentColor"
    >
      <path d="M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z" />
    </Box>
  );

  const handleDownloadExcel = async () => {
    try {
      const response = await fetch('http://localhost:3001/api/search', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiNTFlYzliNC1lM2M0LTQyODgtYTE3Mi05NzAxMGRmMGI2ODciLCJlbWFpbCI6Im1vaGFtbWFkQGVtYWlsLmNvbSIsImlhdCI6MTczOTI4NzYzMCwiZXhwIjoxNzM5MjkxMjMwfQ.tCGYP2s4OIltmKRQ7pOHrbTG7pDwdWF6tlrt0CXmk0A',
        },
        body: JSON.stringify({
          jql: 'project = HCMPRE AND labels = hcmpre-campaign-import AND issuetype = Epic',
          maxResults: 100,
          fields: ['summary', 'status', 'assignee', 'project'],
        }),
      });

      if (!response.ok) throw new Error('API call failed');
      const data = await response.json();

      // Map response to Excel-friendly format
      const items = data.issues.map((issue) => ({
        Key: issue.key,
        'Campaign Name': issue.fields.summary || '',
        Status: issue.fields.status?.name || '',
        Assignee: issue.fields.assignee?.displayName || 'Unassigned',
        Project: issue.fields.project?.name || '',
      }));

      // Convert JSON to worksheet
      const worksheet = XLSX.utils.json_to_sheet(items);
      const workbook = XLSX.utils.book_new();
      XLSX.utils.book_append_sheet(workbook, worksheet, 'Campaigns');

      // Generate Excel file
      const excelBuffer = XLSX.write(workbook, {
        bookType: 'xlsx',
        type: 'array',
      });

      const blob = new Blob([excelBuffer], {
        type: 'application/octet-stream',
      });

      saveAs(blob, 'campaign_data.xlsx');
    } catch (error) {
      console.error('Error downloading Excel:', error);
    }
  };

  return (
    <Container maxWidth="lg">
      <Box sx={{ minHeight: '100vh', py: 4 }}>
        {/* Button row with proper alignment */}
        <Box sx={{ display: 'flex', alignItems: 'center', gap: 2, mb: 3 }}>
          <Button
            variant="outlined"
            onClick={() => navigate('/')}
            startIcon={<ArrowBackIcon />}
          >
            Back to Home
          </Button>

          <Button
            variant="contained"
            color="primary"
            onClick={handleDownloadExcel}
          >
            Download Excel
          </Button>
        </Box>

        {/* Campaign details section */}
        <CampaignDetails />
      </Box>
    </Container>
  );
}

export default CampaignDetailsScreen;
