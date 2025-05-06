-- WITH sub1 AS(
--     SELECT
--         sales.orders_id
--         ,sales.date_date
--         ,sales.revenue
--         ,sales.quantity
--         ,(sales.quantity * products.purchase_price)  AS purchase_cost
--         ,sales.revenue-((sales.quantity * products.purchase_price)) AS margin
--     FROM  {{ ref("stg_raw__sales")}} AS sales
--     LEFT JOIN  {{ ref("stg_raw__product")}} AS products
--         USING (products_id)
-- )

SELECT *
    orders_id
   ,date_date
    ,SUM(revenue) AS revenue
    ,SUM(quantity) AS quantity
    ,SUM(purchase_cost) AS purchase_cost
    ,SUM(margin) AS margin
FROM {{ ref("int_sales_margin")}} 
GROUP BY orders_id, date_date

