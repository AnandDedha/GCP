CREATE VIEW views_demo.male_names(name, number) AS
    SELECT
      name,
      number
    FROM
      `bigquery-demo-347418.Views_Demo.names`
    WHERE
      Gender = "M"
    ORDER BY
      number DESC
