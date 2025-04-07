/*
==========================================================================
LOAD DATA INTO BRONZE SCHEMA
==========================================================================
Script Purpose:
  This script loades data from csv file into bronze schema tables with particiular rules. 
  Script prints appropriate messages about every process.
  It perform the following actions:
  - Truncates table before loading data.
  - Loades data into bronze tables using BULK INSERT from csv files.


Usage Example:
EXECUTE bronze.load_bronze;
*/



CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @start_time_batch DATETIME, @end_time_batch DATETIME;
	BEGIN TRY
		SET @start_time_batch = GETDATE();
		PRINT '=========================================================';
		PRINT 'LOADING BRONZE LAYER';
		PRINT '=========================================================';

		PRINT '---------------------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '---------------------------------------------------------';
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>> Inserting Data Into Table: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info 
		FROM 'D:\SQL_Data_Warehouse\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time)AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>> Inserting Data Into Table: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info 
		FROM 'D:\SQL_Data_Warehouse\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time)AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>> Inserting Data Into Table: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\SQL_Data_Warehouse\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time)AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------------------------------';

		PRINT '---------------------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '---------------------------------------------------------';
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT '>> Inserting Data Into Table: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\SQL_Data_Warehouse\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time)AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------------------------------';
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '>> Inserting Data Into Table: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\SQL_Data_Warehouse\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time)AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------------------------------';
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '>> Inserting Data Into Table: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\SQL_Data_Warehouse\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time)AS NVARCHAR) + ' seconds';
		PRINT '---------------------------------------------------------';
		SET @end_time_batch = GETDATE();
		PRINT '>> Load Duration of Whole Batch: ' + CAST(DATEDIFF(second, @start_time_batch, @end_time_batch)AS NVARCHAR) + ' seconds';
	END TRY
	BEGIN CATCH
		PRINT '=========================================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message ' + ERROR_MESSAGE();
		PRINT 'Error Number ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State ' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '=========================================================';
	END CATCH
END
