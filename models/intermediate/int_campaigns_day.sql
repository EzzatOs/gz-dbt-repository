SELECT *
FROM {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date DESC