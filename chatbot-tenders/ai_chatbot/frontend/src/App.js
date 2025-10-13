import React, { useState } from 'react';
import './styles/App.css';
import QueryInput from './components/QueryInput';
import DataTable from './components/DataTable';
import DataSourceSelector from './components/DataSourceSelector';
import axios from 'axios';
import { API_ENDPOINTS } from './utils/apiConfig';
import { parseResponse } from './utils/dataParser';

function App() {
  const [dataSource, setDataSource] = useState('postgresql');
  const [queryResult, setQueryResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const handleQuery = async (query) => {
    if (!query.trim()) {
      setError('Please enter a query');
      return;
    }

    setLoading(true);
    setError(null);
    setQueryResult(null);

    try {
      const response = await axios.post(API_ENDPOINTS.UNIFIED_QUERY, {
        question: query.trim(),
        data_source: dataSource,
        use_hf: false
      });

      // Parse the response based on data source
      const parsedData = parseResponse(response.data, dataSource);

      if (parsedData.error) {
        setError(parsedData.error);
      } else {
        setQueryResult({
          ...parsedData,
          data_source: response.data.data?.source || dataSource,
          natural_query: query.trim(),
          sql_query: response.data.data?.sql,
          es_query: response.data.data?.query_body,
          index_name: response.data.data?.index,
          answer: response.data.answer
        });
      }
    } catch (err) {
      console.error('API Error:', err);

      // Extract meaningful error message
      let errorMessage = 'Failed to execute query';

      if (err.response?.data?.detail) {
        // Parse backend error detail
        const detail = err.response.data.detail;

        if (detail.includes('relation') && detail.includes('does not exist')) {
          // Table/relation not found error
          const tableMatch = detail.match(/relation "([^"]+)" does not exist/);
          const tableName = tableMatch ? tableMatch[1] : 'specified table';
          errorMessage = `Table "${tableName}" does not exist in the database. Please check the table name or try a different query.`;
        } else if (detail.includes('UndefinedTable')) {
          errorMessage = 'The requested table was not found in the database. Please verify the table name.';
        } else if (detail.includes('UndefinedColumn')) {
          errorMessage = 'One or more columns in the query do not exist. Please check the column names.';
        } else if (detail.includes('SyntaxError')) {
          errorMessage = 'Invalid SQL syntax generated. Please try rephrasing your query.';
        } else if (detail.includes('no such index')) {
          errorMessage = 'The Elasticsearch index was not found. Please try a different query.';
        } else {
          // Generic error from backend
          errorMessage = detail.split('\n')[0]; // Get first line of error
        }
      } else if (err.response?.data?.error) {
        errorMessage = err.response.data.error;
      } else if (err.code === 'ECONNREFUSED' || err.code === 'ERR_NETWORK') {
        errorMessage = 'Unable to connect to the database API. Please check your network connection.';
      } else if (err.message) {
        errorMessage = err.message;
      }

      setError(errorMessage);
    } finally {
      setLoading(false);
    }
  };

  const handleClear = () => {
    setQueryResult(null);
    setError(null);
  };

  return (
    <div className="App">
      <header className="app-header">
        <h1>Database Viewer</h1>
        <p>Query PostgreSQL and Elasticsearch databases with natural language</p>
      </header>

      <main className="app-main">
        <div className="controls-section">
          <DataSourceSelector
            dataSource={dataSource}
            onChange={setDataSource}
            disabled={loading}
          />

          <QueryInput
            onSubmit={handleQuery}
            onClear={handleClear}
            loading={loading}
            dataSource={dataSource}
          />
        </div>

        {error && (
          <div className="error-container">
            <div className="error-icon">⚠️</div>
            <div className="error-content">
              <h3>Query Failed</h3>
              <p>{error}</p>
              <div className="error-suggestions">
                <strong>Suggestions:</strong>
                <ul>
                  <li>Try using one of the example queries below</li>
                  <li>Check if the table or index name is correct</li>
                  <li>Rephrase your question in a different way</li>
                </ul>
              </div>
            </div>
          </div>
        )}

        {loading && (
          <div className="loading-message">
            <div className="spinner"></div>
            <p>Executing query...</p>
          </div>
        )}

        {queryResult && !loading && (
          <DataTable
            data={queryResult}
            dataSource={dataSource}
          />
        )}
      </main>

      <footer className="app-footer">
        <p>Powered by PostgreSQL & Elasticsearch | Natural Language Queries via LangChain</p>
      </footer>
    </div>
  );
}

export default App;
