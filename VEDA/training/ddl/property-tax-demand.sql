CREATE TABLE property_tax_demand (
    id SERIAL PRIMARY KEY,
    property_id VARCHAR(50) REFERENCES property(property_id) ON DELETE CASCADE,
    financial_year VARCHAR(10) NOT NULL, -- e.g., '2024-25'
    tax_amount NUMERIC(12,2) CHECK (tax_amount >= 0),
    penalty_amount NUMERIC(12,2) DEFAULT 0 CHECK (penalty_amount >= 0),
    rebate_amount NUMERIC(12,2) DEFAULT 0 CHECK (rebate_amount >= 0),
    net_demand NUMERIC(12,2) GENERATED ALWAYS AS (tax_amount + penalty_amount - rebate_amount) STORED,
    status VARCHAR(20) CHECK (status IN ('PAID', 'PARTIALLY_PAID', 'UNPAID')) DEFAULT 'UNPAID',
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
