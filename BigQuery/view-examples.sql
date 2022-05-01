## Creating view using the BigQuery DDL
CREATE VIEW views_demo.male_names(name, number) AS
SELECT
      name,
      count
    FROM
      `bigquery-demo-347418.Views_Demo.names`
    WHERE
      Gender = "M"
    ORDER BY
      count DESC
