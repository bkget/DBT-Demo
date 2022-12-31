-- Refunds have a negative amount, so the total amount should always be >= 0.
-- Therefore return records where this isn't true to make the test fail

SELECT

    customer_id,
    
    Sum(customer_lifetime_value) as order_amount

FROM {{ ref('dim_customers' )}}

GROUP BY 1

HAVING NOT(SUM(customer_lifetime_value) >= 0)