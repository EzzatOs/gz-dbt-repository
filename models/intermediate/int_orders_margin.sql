SELECT 
orders_id,
ROUND(SUM(revenue),2) AS total_revenue,
SUM(quantity) AS quantity,
ROUND(SUM(purchase_cost),2) AS purchase_cost,
ROUND(SUM(margin),2) AS margin
FROM 
{{ ref('int_sales_margin') }}
JOIN 
{{ ref('stg_raw__sales') }} AS s
USING (orders_id)
GROUP BY orders_id
