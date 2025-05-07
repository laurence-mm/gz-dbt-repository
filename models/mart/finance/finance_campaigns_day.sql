SELECT 
    f.date_date
    ,(f.operational_margin - c.ads_cost) AS ads_margin           --ads_margin = operational_margin - ads_cost
    ,f.average_basket
    ,f.operational_margin
    ,c.ads_cost
    ,c.ads_impression 
    ,c.ads_click
    ,f.qty_of_products_sold AS quantity
    ,f.revenue
    ,f.purchase_cost
 --   ,f.margin                                  -- à faire remonter car non dispo dans table f
    ,f.shipping_fee 
    ,f.log_cost AS logcost
 --   ,f.shipping_fee AS ship_cost               --revoir de ship_cost              
FROM  {{ ref("finance_days")}} AS f
LEFT JOIN  {{ ref("int_campaigns_day")}} AS c
    USING (date_date)