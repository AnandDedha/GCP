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

## Persistent udf

CREATE OR REPLACE FUNCTION
  udf.cleanse_string_test (text STRING)
  RETURNS STRING
  AS (REGEXP_REPLACE(LOWER(TRIM(text)), '[^a-zA-Z0-9 ]+', ''));



## Routines Info
SELECT *
  FROM udf.INFORMATION_SCHEMA.ROUTINES
