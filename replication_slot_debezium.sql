-- Connect to your PostgreSQL database
-- Check existing replication slots
SELECT * FROM pg_replication_slots;

-- Drop the "debezium" replication slot if it exists and is not in use
SELECT pg_drop_replication_slot('debezium');
