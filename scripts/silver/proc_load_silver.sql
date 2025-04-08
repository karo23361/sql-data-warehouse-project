INSERT INTO silver.crm_cust_info (
	cst_id, 
	cst_key, 
	cst_firstname, 
	cst_lastname, 
	cst_maritial_status, 
	cst_gndr,
	cst_create_date)

SELECT 
cst_id,
cst_key,
TRIM(cst_firstname) as cst_firstname,
TRIM(cst_lastname) as cst_lastname,
CASE WHEN UPPER(TRIM(cst_maritial_status)) = 'S' THEN 'Single'
	 WHEN UPPER(TRIM(cst_maritial_status)) = 'M' THEN 'Married'
	 ELSE 'n/a'
END cst_maritial_status,
CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
	 WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
	 ELSE 'n/a'
END cst_gndr,
cst_create_date
FROM(
SELECT 
*,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
FROM bronze.crm_cust_info WHERE cst_id IS NOT NULL)t WHERE flag_last = 1 
