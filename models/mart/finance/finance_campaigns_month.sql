SELECT 
EXTRACT(MONTH FROM date_date) AS monthdate,
SUM(ads_margin) AS ads_margin,
SUM(avg_basket) AS avg_basket,
SUM(operational_margin) AS operational_margin,
SUM(ads_cost) AS ads_cost,
SUM(ads_impression) AS ads_impression,
COUNT(ads_click) AS ads_click,
COUNT(quantity) AS quantity,
SUM(revenue) AS revenue,
SUM(purchase_cost) AS purchase_cost,
SUM(margin) AS margin,
SUM(shipping_fee) AS shipping_fee,
SUM(log_cost) AS log_cost,
SUM(ship_cost) AS ship_cost
from {{ ref('finance_campaigns_day') }}
group by EXTRACT(MONTH FROM date_date)
order by monthdate
