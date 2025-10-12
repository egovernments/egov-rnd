import React, { useState } from 'react';
import '../styles/DataTable.css';

const DataTable = ({ data, dataSource }) => {
  const [currentPage, setCurrentPage] = useState(1);
  const rowsPerPage = 20;

  if (!data || !data.columns || !data.rows) {
    return <div className="no-data">No data available</div>;
  }

  const { columns, rows, natural_query, sql_query, es_query, index_name, data_source } = data;

  // Pagination
  const totalPages = Math.ceil(rows.length / rowsPerPage);
  const startIndex = (currentPage - 1) * rowsPerPage;
  const endIndex = startIndex + rowsPerPage;
  const currentRows = rows.slice(startIndex, endIndex);

  const goToPage = (page) => {
    setCurrentPage(Math.max(1, Math.min(page, totalPages)));
  };

  return (
    <div className="data-table-container">
      <div className="table-header">
        <div className="table-info">
          <h2>Query Results</h2>
          <div className="meta-info">
            <span className="badge">{(data_source || dataSource).toUpperCase()}</span>
            {index_name && <span className="badge index-badge">Index: {index_name}</span>}
            <span className="result-count">{rows.length} rows</span>
          </div>
        </div>

        <div className="query-details">
          <details>
            <summary>View Generated Query</summary>
            <div className="query-display">
              <strong>Natural Language:</strong>
              <p>{natural_query}</p>

              {sql_query && (
                <>
                  <strong>SQL Query:</strong>
                  <pre>{sql_query}</pre>
                </>
              )}

              {es_query && (
                <>
                  <strong>Elasticsearch Query:</strong>
                  <pre>{typeof es_query === 'string' ? JSON.stringify(JSON.parse(es_query), null, 2) : JSON.stringify(es_query, null, 2)}</pre>
                </>
              )}
            </div>
          </details>
        </div>
      </div>

      <div className="table-wrapper">
        <table className="data-table">
          <thead>
            <tr>
              <th className="row-number">#</th>
              {columns.map((column, index) => (
                <th key={index}>{column}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {currentRows.length > 0 ? (
              currentRows.map((row, rowIndex) => (
                <tr key={rowIndex}>
                  <td className="row-number">{startIndex + rowIndex + 1}</td>
                  {row.map((cell, cellIndex) => (
                    <td key={cellIndex}>
                      {cell === null || cell === '' ? (
                        <span className="null-value">NULL</span>
                      ) : (
                        cell
                      )}
                    </td>
                  ))}
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan={columns.length + 1} className="no-results">
                  No results found
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>

      {totalPages > 1 && (
        <div className="pagination">
          <button
            className="pagination-btn"
            onClick={() => goToPage(1)}
            disabled={currentPage === 1}
          >
            First
          </button>
          <button
            className="pagination-btn"
            onClick={() => goToPage(currentPage - 1)}
            disabled={currentPage === 1}
          >
            Previous
          </button>

          <span className="pagination-info">
            Page {currentPage} of {totalPages}
          </span>

          <button
            className="pagination-btn"
            onClick={() => goToPage(currentPage + 1)}
            disabled={currentPage === totalPages}
          >
            Next
          </button>
          <button
            className="pagination-btn"
            onClick={() => goToPage(totalPages)}
            disabled={currentPage === totalPages}
          >
            Last
          </button>
        </div>
      )}
    </div>
  );
};

export default DataTable;
