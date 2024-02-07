SELECT


CASE
WHEN CAST(date as STRING) LIKE "%2021-06%" then "2021-06-01"
WHEN CAST(date as STRING) LIKE "%2021-07%" then "2021-07-01"
WHEN CAST(date as STRING) LIKE "%2021-08%" then "2021-08-01"
WHEN CAST(date as STRING) LIKE "%2021-09%" then "2021-09-01"
END AS date_month,
ROUND(SUM(ads_margin),2) as ads_margin,
ROUND(SUM(op_margin),2) as op_margin,
ROUND(SUM(average_basket),2) as average_basket,
EXTRACT(MONTH FROM date) as datemonth,

FROM {{ref('finance_campaigns_day')}} 
GROUP BY date_month, datemonth 
