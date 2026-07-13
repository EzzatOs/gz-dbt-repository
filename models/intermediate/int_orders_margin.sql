SELECT 
orders_id,
date_date,
SUM(revenue)AS total_revenue,
SUM(quantity) AS total_quantity,
SUM(purchase_price)AS total_purchase_price,
SUM(purchase_cost) AS purchase_cost,
SUM(margin) AS margin
FROM 
{{ ref('int_sales_margin') }} 
GROUP BY orders_id, date_date 
