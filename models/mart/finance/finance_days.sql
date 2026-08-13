


SELECT 
date_date,
COUNT(DISTINCT orders_id) AS total_transactions,
ROUND(SUM(total_revenue),2) AS total_revenue,
ROUND(SAFE_DIVIDE(SUM(total_revenue), COUNT(DISTINCT orders_id)),2) AS avg_basket,
ROUND(AVG(purchase_cost),2) AS avg_purchase_cost,
ROUND(AVG(shipping_fee),2) AS avg_shipping_fee,
ROUND(AVG(logcost),2) AS avg_logcost,
SUM(total_quantity) AS total_quantity_sold,
ROUND(AVG(Operational_margin),2) AS avg_operational_margin,
Operational_margin
FROM 
 {{ ref('int_orders_operational') }} 
GROUP BY date_date, Operational_margin
ORDER BY date_date

