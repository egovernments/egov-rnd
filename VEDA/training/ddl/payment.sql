CREATE TABLE payment (
    id SERIAL PRIMARY KEY,
    property_id VARCHAR(50) REFERENCES property(property_id) ON DELETE CASCADE,
    demand_id INT REFERENCES property_tax_demand(id) ON DELETE CASCADE,
    tenant_id VARCHAR(20) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount_paid NUMERIC(12,2) CHECK (amount_paid >= 0),
    payment_mode VARCHAR(20) CHECK (payment_mode IN ('CASH', 'ONLINE', 'CHEQUE')),
    transaction_reference_no VARCHAR(50),
    receipt_no VARCHAR(50) UNIQUE,
    status VARCHAR(20) CHECK (status IN ('SUCCESS', 'FAILED', 'PENDING')) DEFAULT 'SUCCESS'
);
