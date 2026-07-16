SELECT date_date, 
SUM(ads_cost) AS ads_cost,
SUM(click) AS click,
SUM(impression) AS impression
FROM {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date DESC