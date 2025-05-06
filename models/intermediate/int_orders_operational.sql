SELECT
    sales.orders_id
    ,sales.date_date
    ,(sales.margin + sh.shipping_fee -sh.logcost -sh.ship_cost) AS operational_margin
FROM  {{ ref("int_orders_margin")}} AS sales
LEFT JOIN  {{ ref("stg_raw__ship")}} AS sh
    USING (orders_id)
