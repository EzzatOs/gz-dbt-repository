SELECT 
im.date_date,
COUNT(DISTINCT im.orders_id) AS total_transactions,
ROUND(SUM(pd.total_revenue),2) AS total_revenue,
ROUND(SAFE_DIVIDE(SUM(pd.total_revenue), COUNT(DISTINCT im.orders_id)),2) AS avg_basket,
ROUND(AVG(pd.purchase_cost),2) AS avg_purchase_cost,
ROUND(AVG(oo.shipping_fee),2) AS avg_shipping_fee,
ROUND(AVG(oo.logcost),2) AS avg_logcost,
SUM(pd.quantity) AS total_quantity_sold,
ROUND(AVG(oo.Operational_margin),2) AS avg_operational_margin
FROM 
{{ ref('int_sales_margin') }} AS im
JOIN {{ ref('int_orders_margin') }} AS pd
USING(orders_id)
JOIN {{ ref('int_orders_operational') }} AS oo
USING(orders_id)
GROUP BY im.date_date
ORDER BY im.date_date

