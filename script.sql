           --Designing Relational Databases--
                  --Database Triggers--

--STEP 1: Existing Structure
SELECT *
FROM customers
ORDER BY customer_id;
 
SELECT *
FROM customers_log;

--STEP 2: Update Triggers
CREATE TRIGGER customer_updated
    BEFORE UPDATE ON customers
    FOR EACH ROW
    EXECUTE PROCEDURE log_customers_change();

--STEP 3
UPDATE customers
SET first_name = 'Steve'
WHERE last_name = 'Hall';
 
SELECT *
FROM customers
ORDER BY customer_id;
 
SELECT *
FROM customers_log;

--STEP 4
UPDATE customers
SET years_old = 10;
WHERE last_name = 'Hall';
 
SELECT *
FROM customers
ORDER BY customer_id;
 
SELECT *
FROM customers_log;

--STEP 5: Insert Triggers
CREATE TRIGGER customer_insert
    AFTER INSERT ON customers
    FOR EACH STATEMENT
    EXECUTE PROCEDURE log_customers_change();

--STEP 6: 
INSERT INTO <table_1> (first_name,last_name,years_old)
VALUES
    ('Jeffrey','Cook',66),
    ('Arthur','Turner',49),
    ('Nathan','Cooper',72);
 
SELECT *
FROM customers
ORDER BY customer_id;
 
SELECT *
FROM customers_log;

--STEP 7: Conditionals on your Triggers
CREATE TRIGGER <trigger_name>
    BEFORE UPDATE ON <table_name>
    FOR EACH ROW
    WHEN (NEW.<column_name> < 13)
    EXECUTE PROCEDURE <procedure_name>();

--STEP 8:
UPDATE customers
SET years_old = 12
WHERE last_name = 'Campbell';
 
UPDATE customers
SET years_old = 24
WHERE last_name = 'Cook';
 
SELECT *
FROM customers
ORDER BY customer_id;
 
SELECT *
FROM customers_log;

--STEP 9:
UPDATE customers
SET years_old = 9,
    first_name = 'Dennis'
WHERE last_name = 'Hall';
 
SELECT *
FROM customers
ORDER BY customer_id;
 
SELECT *
FROM customers_log;

--STEP 10: Trigger Cleanup
DROP TRIGGER IF EXISTS customer_min_age ON customers;

SELECT * FROM information_schema.triggers;

--STEP 11:
SELECT * FROM information_schema.triggers;


