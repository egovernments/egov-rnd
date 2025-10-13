/**
 * Flatten nested objects for table display
 * Example: { Data: { tenantData: { address: "123" } } } => { "Data.tenantData.address": "123" }
 */
export const flattenObject = (obj, prefix = '') => {
  const flattened = {};

  for (const key in obj) {
    if (obj.hasOwnProperty(key)) {
      const value = obj[key];
      const newKey = prefix ? `${prefix}.${key}` : key;

      if (value !== null && typeof value === 'object' && !Array.isArray(value)) {
        Object.assign(flattened, flattenObject(value, newKey));
      } else {
        flattened[newKey] = value;
      }
    }
  }

  return flattened;
};

/**
 * Parse PostgreSQL response
 * Structure: { data: { records: [...], columns: [...] } }
 */
export const parsePostgreSQLResponse = (response) => {
  try {
    const records = response.data?.records || [];

    if (records.length === 0) {
      return { columns: [], rows: [] };
    }

    // Get all unique column names from all records
    const allKeys = new Set();
    records.forEach(record => {
      Object.keys(record).forEach(key => allKeys.add(key));
    });

    const columns = Array.from(allKeys);

    // Convert records to rows
    const rows = records.map(record => {
      return columns.map(col => {
        const value = record[col];
        return value === null || value === undefined ? null : String(value);
      });
    });

    return { columns, rows };
  } catch (error) {
    console.error('Error parsing PostgreSQL response:', error);
    return { columns: [], rows: [], error: error.message };
  }
};

/**
 * Parse Elasticsearch response
 * Structure: { data: { records: [{ Data: {...} }, ...] } }
 */
export const parseElasticsearchResponse = (response) => {
  try {
    const records = response.data?.records || [];

    if (records.length === 0) {
      return { columns: [], rows: [] };
    }

    // Flatten all records
    const flattenedRecords = records.map(record => flattenObject(record));

    // Get all unique column names
    const allKeys = new Set();
    flattenedRecords.forEach(record => {
      Object.keys(record).forEach(key => allKeys.add(key));
    });

    const columns = Array.from(allKeys).sort();

    // Convert flattened records to rows
    const rows = flattenedRecords.map(record => {
      return columns.map(col => {
        const value = record[col];
        return value === null || value === undefined ? null : String(value);
      });
    });

    return { columns, rows };
  } catch (error) {
    console.error('Error parsing Elasticsearch response:', error);
    return { columns: [], rows: [], error: error.message };
  }
};

/**
 * Parse unified API response based on data source
 */
export const parseResponse = (response, dataSource) => {
  const source = response.data?.source || dataSource;

  if (source === 'elasticsearch') {
    return parseElasticsearchResponse(response);
  } else {
    return parsePostgreSQLResponse(response);
  }
};
