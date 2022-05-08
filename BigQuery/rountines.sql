## Stored Procedure Syntax
CREATE PROCEDURE dataset_name.procedure_name
BEGIN
-- statements here
END


## Stored procedure example
CREATE OR REPLACE PROCEDURE udf.create_customer()
BEGIN
  DECLARE id STRING;
  SET id = GENERATE_UUID();
  INSERT INTO udf.customers (id)
    VALUES(id);
  SELECT FORMAT("Created customer %s", id);
END


## Persistent udf

CREATE OR REPLACE FUNCTION
  udf.cleanse_string_test (text STRING)
  RETURNS STRING
  AS (REGEXP_REPLACE(LOWER(TRIM(text)), '[^a-zA-Z0-9 ]+', ''));
  
WITH strings AS
  (SELECT '  Hello, World!!!  ' AS text
  UNION ALL
  SELECT ' I am $Special$ STrINg ' AS text
  UNION ALL
  SELECT ' John, Doe ' AS text)
SELECT text
     , `bigquery-demo-347418.udf.cleanse_string_test`(text) AS clean_text
FROM strings;


## Table Valued function
CREATE OR REPLACE TABLE FUNCTION udf.names_by_year(y INT64)
AS
  SELECT year, name, SUM(number) AS total
  FROM `bigquery-public-data.usa_names.usa_1910_current`
  WHERE year = y
  GROUP BY year, name
  
 ## Temporary UDf
CREATE TEMP FUNCTION cleanse_string (text STRING)
  RETURNS STRING
  AS (REGEXP_REPLACE(LOWER(TRIM(text)), '[^a-zA-Z0-9 ]+', ''));
WITH strings AS
  (SELECT '  Hello, World!!!  ' AS text
  UNION ALL
  SELECT ' I am $Special$ STrINg ' AS text
  UNION ALL
  SELECT ' John, Doe ' AS text)
SELECT text
     , cleanse_string(text) AS clean_text
FROM strings;
  
## TVF example
SELECT * FROM mydataset.names_by_year(1950)
  ORDER BY total DESC
  LIMIT 5

## Routines Info
SELECT *
  FROM udf.INFORMATION_SCHEMA.ROUTINES
