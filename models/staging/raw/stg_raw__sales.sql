with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
        date_date as date,
        orders_id,
        pdt_id as products_id, 
        CAST(revenue as FLOAT64) as revenue,
        CAST(quantity as FLOAT64) as quantity
    from source

)

select * from renamed
