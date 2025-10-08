import axios from "axios";

const JIRA_API_BASE_URL = "/api/jira";

// Base64 encoded credentials
const getAuthHeader = () => {
  const email = import.meta.env.VITE_JIRA_EMAIL;
  const token = import.meta.env.VITE_JIRA_API_TOKEN;
  const credentials = btoa(`${email}:${token}`);
  return `Basic ${credentials}`;
};

export const searchJiraIssues = async (jql, maxResults = 50, fields = ["key", "summary", "status", "assignee", "project"]) => {
  try {
    const response = await axios.post(
      `${JIRA_API_BASE_URL}/search/jql`,
      {
        jql,
        maxResults,
        fields,
      },
      {
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          Authorization: getAuthHeader(),
        },
      }
    );

    return response.data;
  } catch (error) {
    console.error("Error fetching Jira issues:", error);
    throw error;
  }
};

export const getProjectEpics = async (projectKey = "HDDF", maxResults = 50) => {
  const jql = `project = ${projectKey} AND issuetype = Epic ORDER BY created DESC`;
  return searchJiraIssues(jql, maxResults);
};
