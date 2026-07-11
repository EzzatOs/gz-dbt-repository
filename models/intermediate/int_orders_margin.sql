SELECT 
orders_id,
SUM(revenue) AS total_revenue,
date_date,
SUM(quantity) AS quantity,
SUM(purchase_cost) AS purchase_cost,
SUM(margin) AS margin
FROM 
{{ ref('int_sales_margin') }}
JOIN 
{{ ref('stg_raw__sales') }}
USING (orders_id)
GROUP BY orders_id
ORDER BY orders_id