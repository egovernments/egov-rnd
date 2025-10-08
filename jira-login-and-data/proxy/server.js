const express = require("express");
const axios = require("axios");
const cors = require("cors");

const app = express();
const port = 3001;

app.use(cors());
app.use(express.json());

// Jira credentials for Basic Auth
const JIRA_EMAIL = "ashish.tiwari@egovernments.org";
const JIRA_API_TOKEN =
  "ATATT3xFfGF0s9AOKDaUjwB4fq_42SuhI7KVqEPh5nqGhm649EXH3t8lQ88zU5PWxO-U9M3p5Xi1Vkg5yxSSb95x2vtTh74LXSzfYqDD4AJO2uxcH8Sy9Gwcc-4a-f33Uox9Ie2vsTLUi2CkPrB6tbsbxjFta_cFQrPwzeLjdWaylsJGIeO5lxY=4EFB4414";
const JIRA_DOMAIN = "digit-discuss.atlassian.net";

// Create Base64-encoded string for Basic Auth
const BASIC_AUTH = Buffer.from(`${JIRA_EMAIL}:${JIRA_API_TOKEN}`).toString("base64");

app.post("/api/search", async (req, res) => {
  try {
    const body = req.body; // full body: jql, maxResults, fields, etc.
    console.log("Received body:", body);

    // Basic Auth header
    const headers = {
      Authorization: `Basic ${BASIC_AUTH}`,
      Accept: "application/json",
    };

    const response = await axios.post(`https://${JIRA_DOMAIN}/rest/api/3/search/jql`, body, { headers });

    res.json(response.data);
  } catch (error) {
    console.error(error.response?.data || error.message);
    res.status(error.response?.status || 500).json(error.response?.data || { error: error.message });
  }
});

app.listen(port, () => {
  console.log(`Proxy server listening at http://localhost:${port}`);
});
