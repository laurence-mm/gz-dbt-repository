with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        --shipping_fee_1,     --not used, duplicate of column shipping_fee
        logcost,
        CAST(ship_cost AS FLOAT64) ship_cost    --change of dataa type to FLOAT

    from source

)

select * from renamed
