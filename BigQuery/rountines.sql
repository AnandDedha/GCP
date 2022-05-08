## Stored procedure
CREATE OR REPLACE PROCEDURE udf.create_customer()
BEGIN
  DECLARE id STRING;
  SET id = GENERATE_UUID();
  INSERT INTO udf.customers (id)
    VALUES(id);
  SELECT FORMAT("Created customer %s", id);
END

## UDf



## Routines Info
SELECT *
  FROM udf.INFORMATION_SCHEMA.ROUTINES
