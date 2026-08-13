select
    f.date_date,
    (f.avg_operational_margin - i.ads_cost) as ads_margin,
    f.avg_basket,
    (f.avg_operational_margin) as operational_margin,
    i.ads_cost,
    (i.impression) as ads_impression,
    (i.click) as ads_click,
    (f.total_quantity_sold) as quantity,
    (f.total_revenue) as revenue,
    (f.avg_purchase_cost) as purchase_cost,
    (f.total_revenue - f.avg_purchase_cost) as margin,
    (f.avg_shipping_fee) as shipping_fee,
    (f.avg_logcost) as log_cost,
    (f.avg_shipping_fee) as ship_cost
from {{ ref("finance_days") }} as f
left join {{ ref("int_campaigns_day") }} as i 
using (date_date)
