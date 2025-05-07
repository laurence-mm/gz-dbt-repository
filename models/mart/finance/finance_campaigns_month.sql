SELECT 
    DATE_TRUNC(date_date, MONTH) AS date_month  --The resulting value is always rounded to the beginning of granularity
    ,EXTRACT(MONTH FROM date_date) AS month_
    ,ROUND(SUM(ads_margin),2) AS ads_margin
    ,ROUND(SUM(average_basket),2) AS average_basket
    ,ROUND(SUM(operational_margin),2) AS operational_margin
    ,SUM(ads_cost) AS ads_cost
    ,SUM(ads_impression) AS ads_impression
    ,SUM(ads_click) AS ads_click
    ,SUM(qty_of_products_sold) AS qty_of_products_sold
    ,ROUND(SUM(revenue),2) AS revenue
    ,ROUND(SUM(purchase_cost),2) AS purchase_cost
    ,ROUND(SUM(margin),2) AS margin
    ,ROUND(SUM(shipping_fee),2) AS shipping_fee
    ,ROUND(SUM(logcost),2) AS logcost
    ,ROUND(SUM(ship_cost),2) AS ship_cost
FROM  {{ ref("finance_campaigns_day")}}
GROUP by date_month, month_
ORDER BY date_month DESC