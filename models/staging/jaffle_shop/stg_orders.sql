WITH source AS (

    {{
        config(
            materialized = 'incremental',
            unique_key = 'order_id'
        )
    }}


    -- Normally we would SELECT FROM the table here, but we are using seeds to load
    -- our data in this project
    
    
    SELECT
    
      * 
    
    FROM {{ source('jaffle_shop', 'raw_orders') }}

   -- Set the limit for 1000 days order data

    -- {{limit_data_in_dev('order_date', 1000)}}

),

renamed AS (

    SELECT
        id AS order_id,
        user_id AS customer_id,
        order_date,
        status

    FROM source

)

SELECT 
   *
FROM renamed