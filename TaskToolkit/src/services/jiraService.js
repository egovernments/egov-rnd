import axios from 'axios';

const JIRA_API_BASE_URL = '/api/jira';

// Base64 encoded credentials
const getAuthHeader = () => {
  const email = 'nabeel.md@egovernments.org';
  const token = 'ATATT3xFfGF0hRx2Fej3IuOVpXaFafEAhe5ghy66ZWs1ZB5WBPd7w12_NXZsEDuiuvF4x-wQ-P0XuKisBCPLwoe7R5ZMSOTRKAjJUI1YwiyNnQvu69j0ysJVBpLLzwAaSxV4C1GUOAEDg7zUKKvYl9pf8sBqHhhHw7P6aUbhIxoqEZr8GCuJyok=9AF62308';
  const credentials = btoa(`${email}:${token}`);
  return `Basic ${credentials}`;
};

export const searchJiraIssues = async (jql, maxResults = 50, fields = ['key', 'summary', 'status', 'assignee', 'project']) => {
  try {
    const response = await axios.post(`${JIRA_API_BASE_URL}/search/jql`, {
      jql,
      maxResults,
      fields
    }, {
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': getAuthHeader()
      }
    });

    return response.data;
  } catch (error) {
    console.error('Error fetching Jira issues:', error);
    throw error;
  }
};

export const getProjectEpics = async (projectKey = 'HDDF', maxResults = 50) => {
  const jql = `project = ${projectKey} AND issuetype = Epic ORDER BY created DESC`;
  return searchJiraIssues(jql, maxResults);
};
