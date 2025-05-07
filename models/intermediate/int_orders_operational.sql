SELECT
    sales.orders_id
    ,sales.date_date
    ,(sales.margin + sh.shipping_fee -sh.logcost -sh.ship_cost) AS operational_margin
    ,sales.margin
    ,sales.revenue                                                      --new for finance_days 
    ,sales.quantity                                                     --new for finance_days 
    ,sales.purchase_cost                                                --new for finance_days 
    ,sh.ship_cost                                                      --new for finance_days
    ,sh.shipping_fee                                                   --new for finance_days
    ,sh.logcost                                                        --new for finance_days
FROM  {{ ref("int_orders_margin")}} AS sales
LEFT JOIN  {{ ref("stg_raw__ship")}} AS sh
    USING (orders_id)
