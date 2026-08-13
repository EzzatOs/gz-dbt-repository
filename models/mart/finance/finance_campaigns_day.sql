SELECT 
f.date_date,
f.avg_operational_margin - i.ads_cost) AS ads_margin,
f.avg_basket,
(f.avg_operational_margin) AS operational_margin,
i.ads_cost,
(i.impression) AS ads_impression,
(i.click) AS ads_click,
(f.total_quantity_sold) AS quantity,
(f.total_revenue) AS revenue,
(f.avg_purchase_cost) AS purchase_cost,
(f.total_revenue - f.avg_purchase_cost) AS margin,
(f.avg_shipping_fee) AS shipping_fee,
(f.avg_logcost) AS log_cost,
(f.avg_shipping_fee) AS ship_cost
FROM {{ ref('finance_days') }} as f
LEFT JOIN {{ ref('int_campaigns_day') }} AS i
USING(date_date)

