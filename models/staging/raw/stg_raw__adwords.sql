with 

source as (

    select * from {{ source('raw', 'adwords') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campgn_name as campaign_name,
        CAST (ads_cost as FLOAT64) as ads_cost,
        impression,
        click

    from source

)

select * from renamed
