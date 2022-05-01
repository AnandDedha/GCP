## Creating view using the BigQuery DDL
CREATE VIEW views_demo.male_names(name, number) AS
SELECT
      name,
      count
    FROM
      `bigquery-demo-347418.views_demo.names`
    WHERE
      Gender = "M"
    ORDER BY
      count DESC


## Creating view using the BigQuery DDL
SELECT
      name,
      count
    FROM
      `bigquery-demo-347418.views_demo.names`
    WHERE
      Gender = "F"
    ORDER BY
      count DESC
      
## MATERIALIZED VIEW  demo

CREATE MATERIALIZED VIEW  bigquery-demo-347418.mv_demo.my_mv_table
AS SELECT Name, SUM(count) AS sum_count
FROM `bigquery-demo-347418.mv_demo.names`
GROUP BY 1


## Partition Materalzied view
CREATE MATERIALIZED VIEW project-id.my_dataset.my_mv_table
PARTITION BY DATE(transaction_time)
CLUSTER BY employee_id
AS SELECT
  employee_id,
  transaction_time,
  COUNT(1) AS cnt
FROM my_dataset.my_base_table
GROUP BY 1, 2;
