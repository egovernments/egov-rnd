import { useState } from 'react';
import { getProjectEpics, searchJiraIssues } from '../services/jiraService';

const JiraTest = () => {
  const [loading, setLoading] = useState(false);
  const [data, setData] = useState(null);
  const [error, setError] = useState(null);

  const testJiraAPI = async () => {
    setLoading(true);
    setError(null);
    setData(null);

    try {
      const result = await getProjectEpics('HDDF', 50);
      setData(result);
      console.log('Jira API Response:', result);
    } catch (err) {
      setError(err.message || 'Failed to fetch data');
      console.error('Jira API Error:', err);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ padding: '20px', maxWidth: '1200px', margin: '0 auto' }}>
      <h1>Jira API Integration Test</h1>

      <button
        onClick={testJiraAPI}
        disabled={loading}
        style={{
          padding: '10px 20px',
          fontSize: '16px',
          backgroundColor: '#0052CC',
          color: 'white',
          border: 'none',
          borderRadius: '4px',
          cursor: loading ? 'not-allowed' : 'pointer',
          opacity: loading ? 0.6 : 1
        }}
      >
        {loading ? 'Loading...' : 'Test Jira API'}
      </button>

      {error && (
        <div style={{
          marginTop: '20px',
          padding: '15px',
          backgroundColor: '#ffebe9',
          border: '1px solid #ff5630',
          borderRadius: '4px',
          color: '#de350b'
        }}>
          <strong>Error:</strong> {error}
        </div>
      )}

      {data && (
        <div style={{ marginTop: '20px' }}>
          <h2>Results ({data.total} total issues)</h2>

          <div style={{
            backgroundColor: '#f4f5f7',
            padding: '15px',
            borderRadius: '4px',
            marginBottom: '20px'
          }}>
            <pre style={{
              overflow: 'auto',
              maxHeight: '300px',
              fontSize: '12px'
            }}>
              {JSON.stringify(data, null, 2)}
            </pre>
          </div>

          {data.issues && data.issues.length > 0 && (
            <div>
              <h3>Issues:</h3>
              <table style={{
                width: '100%',
                borderCollapse: 'collapse',
                marginTop: '10px'
              }}>
                <thead>
                  <tr style={{ backgroundColor: '#f4f5f7' }}>
                    <th style={{ padding: '10px', textAlign: 'left', border: '1px solid #ddd' }}>Key</th>
                    <th style={{ padding: '10px', textAlign: 'left', border: '1px solid #ddd' }}>Summary</th>
                    <th style={{ padding: '10px', textAlign: 'left', border: '1px solid #ddd' }}>Status</th>
                    <th style={{ padding: '10px', textAlign: 'left', border: '1px solid #ddd' }}>Assignee</th>
                  </tr>
                </thead>
                <tbody>
                  {data.issues.map((issue) => (
                    <tr key={issue.key}>
                      <td style={{ padding: '10px', border: '1px solid #ddd' }}>{issue.key}</td>
                      <td style={{ padding: '10px', border: '1px solid #ddd' }}>{issue.fields?.summary || 'N/A'}</td>
                      <td style={{ padding: '10px', border: '1px solid #ddd' }}>{issue.fields?.status?.name || 'N/A'}</td>
                      <td style={{ padding: '10px', border: '1px solid #ddd' }}>
                        {issue.fields?.assignee?.displayName || 'Unassigned'}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      )}
    </div>
  );
};

export default JiraTest;
