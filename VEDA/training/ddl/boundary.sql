CREATE TABLE boundary (
    code VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50) CHECK (type IN ('STATE', 'CITY', 'ZONE', 'WARD')),
    parent_code VARCHAR(20) REFERENCES boundary(code)
);
