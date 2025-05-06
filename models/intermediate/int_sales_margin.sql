SELECT
    sales.orders_id
    ,sales.date_date
    ,sales.revenue
    ,sales.quantity
--    ,products.purchase_price
    ,(sales.quantity * products.purchase_price)  AS purchase_cost
    ,sales.revenue-((sales.quantity * products.purchase_price)) AS margin
FROM  {{ ref("stg_raw__sales")}} AS sales
LEFT JOIN  {{ ref("stg_raw__product")}} AS products
    USING (products_id)

