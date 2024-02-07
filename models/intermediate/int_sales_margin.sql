select
    sales.products_id,
    sales.date,
    sales.orders_id,
    {{ margin_percent('revenue', 'cast(product.purchase_price as float64) * cast(sales.quantity as float64)') }} as margin_percent,
    cast(sales.revenue as float64) as revenue,
    cast(sales.quantity as float64) as quantity,
    cast(product.purchase_price as float64) as purchase_price,
    cast(product.purchase_price as float64) * cast(sales.quantity as float64) as purchase_cost,
    cast(sales.revenue as float64) - cast(product.purchase_price as float64) as margin,
from {{ ref("stg_raw__sales") }} as sales
left join {{ ref("stg_raw__product") }} as product using (products_id)
