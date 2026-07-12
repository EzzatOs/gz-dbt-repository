SELECT 
date_date,
COUNT(orders_id) AS total_transactions,
SUM(revenue) AS total_revenue,
AVG(SUM(revenue), COUNT(orders_id)) AS avg_basket,
Operational_margin,
SUM(purchase_cost) AS total_purchase_cost,
SUM(shipping_fee) AS total_shipping_fees,
SUM(logcost) AS total_logcost,
SUM(quantity) AS total_quantity_sold
FROM 
{{ ref('int_sales_margin') }}
JOIN {{ ref('int_orders_margin') }}
USING(orders_id)
JOIN {{ ref('int_orders_operational') }}
USING(orders_id)
GROUP BY date_date, Operational_margin;
