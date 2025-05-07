--compile all the 4 campaigns in one common table

SELECT * FROM {{ ref("stg_raw__raw_gz_adwords")}} AS adwords
UNION ALL
SELECT * FROM {{ ref("stg_raw__raw_gz_bing")}} AS bing
UNION ALL
SELECT * FROM {{ ref("stg_raw__raw_gz_criteo")}} AS criteo
UNION ALL
SELECT * FROM {{ ref("stg_raw__raw_gz_facebook")}} AS facebook
