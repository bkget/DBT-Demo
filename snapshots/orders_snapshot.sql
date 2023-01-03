{% snapshot orders_snapshot %}

    {{
        config(
            target_schema = 'jaffle_shop',
            strategy = 'check',
            unique_key = 'order_id',
            check_cols = ['status']
        )
    }}

    SELECT 
      *
    FROM {{ ref('stg_orders') }}

{% endsnapshot %}

-- we can use 'all' to check all columns in 'check_cols'