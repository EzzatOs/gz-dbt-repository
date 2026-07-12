SELECT 
im.date_date,
COUNT(DISTINCT im.orders_id) AS total_transactions,
SUM(pd.total_revenue) AS total_revenue,
SAFE_DIVIDE(SUM(pd.total_revenue), COUNT(DISTINCT im.orders_id)) AS avg_basket,
AVG(pd.purchase_cost) AS avg_purchase_cost,
AVG(oo.shipping_fee) AS avg_shipping_fee,
AVG(oo.logcost) AS avg_logcost,
SUM(pd.quantity) AS total_quantity_sold,
AVG(oo.Operational_margin) AS avg_operational_margin
FROM 
{{ ref('int_sales_margin') }} AS im
JOIN {{ ref('int_orders_margin') }} AS pd
USING(orders_id)
JOIN {{ ref('int_orders_operational') }} AS oo
USING(orders_id)
GROUP BY im.date_date
ORDER BY im.date_date

