CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
	PRINT '===========================================================';
	PRINT 'Loading the Brnonze Layer';
	PRINT '===========================================================';



	PRINT '===========================================================';
	PRINT 'Loading CRM Table';
	PRINT '===========================================================';
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_cust_info;

	BULK INSERT bronze.crm_cust_info
	FROM 'C:\Users\praka\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
	WITH (

		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 

	);
	SELECT count(*) FROM bronze.crm_cust_info;
	---------

	TRUNCATE TABLE bronze.prd_info;

	BULK INSERT bronze.prd_info
	FROM 'C:\Users\praka\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
	WITH (

		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 

	);

	SELECT count(*) FROM bronze.prd_info;
	----------

	TRUNCATE TABLE bronze.crm_sales_details;

	BULK INSERT bronze.crm_sales_details
	FROM 'C:\Users\praka\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
	WITH (

		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 

	);

	SELECT count(*) FROM bronze.crm_sales_details;

	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
	--------------

	PRINT '===========================================================';
	PRINT 'Loading ERP Table';
	PRINT '===========================================================';

	TRUNCATE TABLE bronze.erp_cust_az12;

	BULK INSERT bronze.erp_cust_az12
	FROM 'C:\Users\praka\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
	WITH (

		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 

	);

	SELECT count(*) FROM bronze.erp_cust_az12;
	---------------

	TRUNCATE TABLE bronze.erp_loc_a101;

	BULK INSERT bronze.erp_loc_a101
	FROM 'C:\Users\praka\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
	WITH (

		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 

	);

	SELECT count(*) FROM bronze.erp_loc_a101;
	-----------------------

	TRUNCATE TABLE bronze.erp_px_cat_g1v2;

	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'C:\Users\praka\Downloads\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
	WITH (

		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK 

	);

	SELECT count(*) FROM bronze.erp_px_cat_g1v2;
	END TRY
	BEGIN CATCH
		PRINT '==============================='
		PRINT 'Error Occued during loading bronze Layer'
		PRINT 'Error Message ' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST(ERROR_NUMBER() as NVARCHAR);
		PRINT 'Error Message' + CAST(ERROR_STATE() as NVARCHAR);
	END CATCH
END
