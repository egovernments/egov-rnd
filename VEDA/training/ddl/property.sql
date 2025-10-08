CREATE TABLE property (
    id SERIAL PRIMARY KEY,
    property_id VARCHAR(50) UNIQUE NOT NULL,
    tenant_id VARCHAR(20) NOT NULL, -- e.g., 'pb.amritsar'
    boundary_code VARCHAR(20) REFERENCES boundary(code),
    owner_id INT REFERENCES owner(id),
    property_usage_type VARCHAR(50) CHECK (property_usage_type IN ('Residential', 'Commercial', 'Industrial', 'Institutional')),
    total_area_sqft NUMERIC(10,2) CHECK (total_area_sqft > 0),
    built_up_area_sqft NUMERIC(10,2) CHECK (built_up_area_sqft >= 0),
    occupancy_type VARCHAR(50) CHECK (occupancy_type IN ('Owner', 'Tenant')),
    status VARCHAR(20) CHECK (status IN ('ACTIVE', 'INACTIVE')) DEFAULT 'ACTIVE',
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_property_tenant_id ON property(tenant_id);
CREATE INDEX idx_property_boundary_code ON property(boundary_code);
CREATE INDEX idx_property_owner_id ON property(owner_id);
