SELECT 
finance.date, 
op_margin - campaign.ads_cost as ads_margin,
op_margin,
average_basket, 
qty,

FROM {{ref('int_campaigns_day')}} as campaign
LEFT JOIN {{ref('finance_days')}} as finance
ON campaign.date_date = finance.date


