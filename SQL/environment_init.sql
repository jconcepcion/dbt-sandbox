-- Snowflake initialization

USE ROLE ACCOUNTADMIN; -- accountadmin needed for user creation, future grants
DROP USER IF EXISTS DBT_CLOUD;
DROP ROLE IF EXISTS TRANSFORMER;
DROP DATABASE IF EXISTS PROD CASCADE;
DROP WAREHOUSE IF EXISTS TRANSFORMING;


-- creating a warehouse
CREATE WAREHOUSE TRANSFORMING WITH WAREHOUSE_SIZE = 'XSMALL' WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 1200 AUTO_RESUME = TRUE COMMENT = 'Warehouse to transform data';

-- creating database
CREATE DATABASE PROD COMMENT = 'production data base';

-- creating schemas
CREATE SCHEMA "PROD"."RAW" COMMENT = 'landing zone for raw data';
CREATE SCHEMA "PROD"."ANALYTICS" COMMENT = 'data layer for end user';

-- creating an access role
CREATE ROLE TRANSFORMER COMMENT = 'Role for dbt';

-- granting role permissions
GRANT USAGE,OPERATE ON WAREHOUSE TRANSFORMING TO ROLE TRANSFORMER;
GRANT USAGE,CREATE SCHEMA ON DATABASE PROD TO ROLE TRANSFORMER;
GRANT USAGE ON SCHEMA "PROD"."RAW" TO ROLE TRANSFORMER;
GRANT ALL ON SCHEMA "PROD"."ANALYTICS" TO ROLE TRANSFORMER;
GRANT SELECT ON ALL TABLES IN SCHEMA "PROD"."RAW" TO ROLE TRANSFORMER;
GRANT SELECT ON FUTURE TABLES IN SCHEMA "PROD"."RAW" TO ROLE TRANSFORMER;

-- creating user and associating with role
CREATE USER DBT_CLOUD PASSWORD='abc123' DEFAULT_ROLE = TRANSFORMER MUST_CHANGE_PASSWORD = true;
GRANT ROLE TRANSFORMER TO USER DBT_CLOUD;
