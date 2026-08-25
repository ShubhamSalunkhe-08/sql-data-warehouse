Use master;
GO
  
--Drop and Recreate the Datawarehouse database
IF EXISTS(SELECT 1 FROM sys.databases where name = 'DataWarehouse')
BEGIN  
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

--Create DataWarehouse Database
CREATE DATABASE DataWarehouse;

USE DataWarehouse;

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
