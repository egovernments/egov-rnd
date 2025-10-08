const express = require('express');
const axios = require('axios');
const cors = require('cors');

const app = express();
const port = 3001;

app.use(cors());
app.use(express.json());

// Jira credentials for Basic Auth
const JIRA_EMAIL = 'ashish.tiwari@egovernments.org';
const JIRA_API_TOKEN = 'ATATT3xFfGF06yfwYh15Ej1eyFnZGC82aqauPoXgsy1Wt_qj2ivsIwPCa5b9Qq5J7EJQYTD3uCs6m2Wh1UAitX-ruPW-1q9KOsrNtzNtFdHszA4HLjmbeAD30sCUj1ThuzADcMUrLpiss36B4-jZdy5nSri82cEUALXdXmeVbjGXmWXFtrNvpB4=38236A6E';
const JIRA_DOMAIN = 'digit-discuss.atlassian.net';

// Create Base64-encoded string for Basic Auth
const BASIC_AUTH = Buffer.from(`${JIRA_EMAIL}:${JIRA_API_TOKEN}`).toString('base64');

app.post('/api/search', async (req, res) => {
  try {
    const body = req.body; // full body: jql, maxResults, fields, etc.
    console.log('Received body:', body);

    // Basic Auth header
    const headers = {
      Authorization: `Basic ${BASIC_AUTH}`,
      Accept: 'application/json',
    };

    const response = await axios.post(
      `https://${JIRA_DOMAIN}/rest/api/3/search/jql`,
      body,
      { headers }
    );

    res.json(response.data);
  } catch (error) {
    console.error(error.response?.data || error.message);
    res
      .status(error.response?.status || 500)
      .json(error.response?.data || { error: error.message });
  }
});

app.listen(port, () => {
  console.log(`Proxy server listening at http://localhost:${port}`);
});
