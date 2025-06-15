
-- ===============================================================================
-- Quality Checks
-- ===============================================================================
/* This script performs various quality checks for data consistency, accuracy, 
   and standardization across the 'bronze' layer. 
   
   It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
    - Run these checks after data loading bronze Layer.
    - Investigate any discrepancies found during the checks.
*/

-- ====================================================================
-- Checking 'bronze.crm_cust_info'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results

SELECT 
cst_id,
COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id = NULL;

-- Check for Unwanted Spaces
-- Expectation: No Results
SELECT 
cst_key
FROM bronze.crm_cust_info
WHERE cst_key != TRIM(cst_key)

SELECT 
cst_firstname,
cst_lastname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname) OR cst_lastname != TRIM(cst_lastname)

-- Data Standardization & Consistency
SELECT DISTINCT cst_marital_status
FROM bronze.crm_cust_info

SELECT DISTINCT cst_gndr
FROM bronze.crm_cust_info

-- ====================================================================
-- Checking 'bronze.crm_prd_info'
-- ====================================================================
-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Results

SELECT prd_id, COUNT(*)
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- Check for Unwanted Spaces
-- Expectation: No Results

SELECT prd_nm 
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM bronze.crm_prd_info

-- ====================================================================
-- Checking 'bronze.crm_sales_details'
-- ====================================================================
-- Check for invalid dates
SELECT NULLIF(sls_order_dt, 0) sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0 OR LEN(sls_order_dt) != 8
	  OR sls_order_dt > 20500101
	  OR sls_order_dt < 19000101
	  
-- Check Data Consistency : Between Sales, Quantity and Price
-- Sales = Quantity * Price
-- Values must not be null, zero or negative.

SELECT DISTINCT sls_sales AS  old_sls_sales,
	   sls_quantity,
	   sls_price AS old_sls_price,
	   CASE WHEN sls_sales IS NULL OR sls_sales <= 0 OR sls_sales != sls_quantity * ABS(sls_price) THEN sls_quantity * ABS(sls_price)
	   	ELSE sls_sales
	   END AS sls_sales

FROM bronze.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
OR sls_sales IS NULL 
OR sls_quantity IS NULL
OR sls_price IS NULL
OR sls_sales <= 0
OR sls_quantity <= 0
OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price

-- ====================================================================
-- Checking 'bronze.erp_cust_az12'
-- ====================================================================
-- Identify out_of-range Dates
SELECT DISTINCT bdate
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

-- Data Standardization & Consistency
SELECT DISTINCT gen
FROM bronze.erp_cust_az12


-- ====================================================================
-- Checking 'bronze.erp_loc_a101'
-- ====================================================================
-- Data Standardization & Consistency
SELECT DISTINCT cntry AS old_cntry,
		CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
		     WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
		     WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'N/A'
		     ELSE TRIM(cntry)
		END AS cntry
FROM bronze.erp_loc_a101

-- ====================================================================
-- Checking 'bronze.erp_px_cat_g1v2'
-- ====================================================================
-- Check unwanted spaces
SELECT * FROM bronze.erp_px_cat_g1v2
WHERE cat!= TRIM(cat)
OR subcat != TRIM(subcat)
OR maintenance != TRIM(maintenance)

-- Data Standardization & Consistency
SELECT DISTINCT cat
FROM bronze.erp_px_cat_g1v2
