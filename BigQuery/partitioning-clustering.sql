select _PARTITIONTIME as pt, _PARTITIONDATE as pd, name from `bigquery-demo-347418.demodataset.names`


#standardSQL
CREATE OR REPLACE TABLE `stackoverflow.questions_2018_clustered`
PARTITION BY
  DATE(creation_date)
CLUSTER BY
  tags AS
SELECT
  id, title, accepted_answer_id, creation_date, answer_count , comment_count , favorite_count, view_count, tags
FROM
  `bigquery-public-data.stackoverflow.posts_questions`
WHERE
  creation_date BETWEEN '2018-01-01' AND '2019-01-01';
