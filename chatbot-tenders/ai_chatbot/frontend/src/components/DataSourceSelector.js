import React from 'react';
import '../styles/DataSourceSelector.css';

const DataSourceSelector = ({ dataSource, onChange, disabled }) => {
  return (
    <div className="data-source-selector">
      <label>Select Database:</label>
      <div className="radio-group">
        <label className={`radio-option ${dataSource === 'postgresql' ? 'active' : ''}`}>
          <input
            type="radio"
            value="postgresql"
            checked={dataSource === 'postgresql'}
            onChange={(e) => onChange(e.target.value)}
            disabled={disabled}
          />
          <span className="radio-label">
            <strong>PostgreSQL</strong>
            <small>Relational database</small>
          </span>
        </label>

        <label className={`radio-option ${dataSource === 'elasticsearch' ? 'active' : ''}`}>
          <input
            type="radio"
            value="elasticsearch"
            checked={dataSource === 'elasticsearch'}
            onChange={(e) => onChange(e.target.value)}
            disabled={disabled}
          />
          <span className="radio-label">
            <strong>Elasticsearch</strong>
            <small>Search engine</small>
          </span>
        </label>
      </div>
    </div>
  );
};

export default DataSourceSelector;
