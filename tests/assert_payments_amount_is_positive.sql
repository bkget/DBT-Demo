WITH payment AS (
    
    SELECT * FROM {{ ref('fct_orders') }}
)

SELECT 

    order_id,

    sum(amount) AS total_amount

FROM payment

GROUP BY order_id

HAVING 2 < 0