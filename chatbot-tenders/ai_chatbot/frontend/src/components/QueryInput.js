import React, { useState } from 'react';
import '../styles/QueryInput.css';

const QueryInput = ({ onSubmit, onClear, loading, dataSource }) => {
  const [query, setQuery] = useState('');

  const exampleQueries = {
    postgresql: [
      'Give me 10 user details of registered persons with address',
      'Show me 20 birth registration applications',
      'List all recent registrations'
    ],
    elasticsearch: [
      'Give me 10 property records',
      'Show me property assessment data',
      'Find payment records'
    ]
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (query.trim()) {
      onSubmit(query);
    }
  };

  const handleClear = () => {
    setQuery('');
    onClear();
  };

  const handleExampleClick = (exampleQuery) => {
    setQuery(exampleQuery);
  };

  return (
    <div className="query-input-section">
      <form onSubmit={handleSubmit} className="query-form">
        <div className="input-group">
          <textarea
            className="query-textarea"
            value={query}
            onChange={(e) => setQuery(e.target.value)}
            placeholder={`Enter your query in natural language...\nExample: "${exampleQueries[dataSource][0]}"`}
            rows="3"
            disabled={loading}
          />
        </div>

        <div className="button-group">
          <button
            type="submit"
            className="btn btn-primary"
            disabled={loading || !query.trim()}
          >
            {loading ? 'Executing...' : 'Execute Query'}
          </button>
          <button
            type="button"
            className="btn btn-secondary"
            onClick={handleClear}
            disabled={loading}
          >
            Clear
          </button>
        </div>
      </form>

      <div className="example-queries">
        <p><strong>Example queries:</strong></p>
        <div className="examples-list">
          {exampleQueries[dataSource].map((example, index) => (
            <button
              key={index}
              className="example-btn"
              onClick={() => handleExampleClick(example)}
              disabled={loading}
            >
              {example}
            </button>
          ))}
        </div>
      </div>
    </div>
  );
};

export default QueryInput;
