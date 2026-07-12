SELECT 
orders_id,
ROUND(SUM(revenue),2) AS total_revenue,
revenue,
SUM(quantity) AS total_quantity,
quantity,
ROUND(SUM(purchase_cost),2) AS total_purchase_cost,
purchase_cost,
ROUND(SUM(margin),2) AS margin
FROM 
{{ ref('int_sales_margin') }}
JOIN 
{{ ref('stg_raw__sales') }} 
USING (orders_id)
GROUP BY orders_id,revenue,quantity,purchase_cost
