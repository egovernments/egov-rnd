CREATE TABLE owner (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    mobile_number VARCHAR(15),
    email VARCHAR(100),
    aadhaar_number VARCHAR(12),
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_owner_mobile_number ON owner(mobile_number);
CREATE INDEX idx_owner_email ON owner(email);
CREATE INDEX idx_owner_aadhaar_number ON owner(aadhaar_number);
CREATE INDEX idx_owner_name ON owner(name);