SELECT * from {{ref('stg_raw__bing')}}
UNION ALL 
SELECT * from {{ref('stg_raw__adwords')}}
UNION ALL 
SELECT * from {{ref('stg_raw__facebook')}}
UNION ALL 
SELECT * from {{ref('stg_raw__criteo')}}