SELECT 
s1.orders_id,
s1.date_date,
ROUND(SUM(s.revenue),2) AS total_revenue,
s.revenue,
SUM(s.quantity) AS total_quantity,
s.quantity,
ROUND(SUM(s1.purchase_cost),2) AS total_purchase_cost,
s1.purchase_cost,
ROUND(SUM(s1.margin),2) AS margins
FROM 
{{ ref('int_sales_margin') }} AS s1
JOIN 
{{ ref('stg_raw__sales') }}  AS s
USING (orders_id)
GROUP BY s1.orders_id,s.revenue,s.quantity,s1.purchase_cost,s1.date_date
