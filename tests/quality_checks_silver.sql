--Check For Nulls Or Duplicates in Primary Key
-- EXpepcation: No Result

SELECT 
cst_id,
COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL



--Check for unwanted Spaces
--Expectation: No results
SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT cst_lastname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)



--Data Standardization & Consistency
SELECT DISTINCT cst_maritial_status
FROM bronze.crm_cust_info
