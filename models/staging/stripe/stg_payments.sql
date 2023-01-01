with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ source('stripe', 'raw_payments') }}

),

renamed as (

    select
        id as payment_id,
        order_id,
        payment_method,

        -- `amount` is currently stored in cents, so we convert it to dollars
        -- amount / 100 as amount
        -- Note: table column name should be quoted inside the macro call 
        {{cent_to_dollar('amount')}} as amount

    from source

)

select * from renamed
