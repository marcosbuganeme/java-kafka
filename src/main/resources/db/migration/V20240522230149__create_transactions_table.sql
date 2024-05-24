CREATE TABLE transactions (
    transaction_id VARCHAR(255) PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    timestamp TIMESTAMP NOT NULL
);
