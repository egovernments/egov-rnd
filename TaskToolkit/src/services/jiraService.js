import axios from "axios";

const JIRA_API_URL = import.meta.env.VITE_JIRA_API_URL;
const BEARER_TOKEN = import.meta.env.VITE_JIRA_BEARER_TOKEN;

export const searchJiraIssues = async (jql, maxResults = 50, fields = ["key", "summary", "status", "assignee", "project"]) => {
  try {
    const response = await axios.post(
      JIRA_API_URL,
      {
        jql,
        maxResults,
        fields,
      },
      {
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
          Authorization: `Bearer ${BEARER_TOKEN}`,
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

export const getCampaigns = async () => {
  const jql = "project = HCMPRE AND labels = hcmpre-campaign-import AND issuetype = Epic";
  const fields = ["summary", "status", "priority", "parent", "duedate"];
  return searchJiraIssues(jql, 100, fields);
};

export const getCampaignDetailByEpicLink = async (epicKey) => {
  const jql = `project = HCMPRE AND labels = hcmpre-campaign-import AND "Epic Link" = ${epicKey}`;
  const fields = ["summary", "status", "priority", "parent", "duedate", "assignee", "project"];
  return searchJiraIssues(jql, 100, fields);
};
