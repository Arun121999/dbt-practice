{{ config(materialized='view') }}

WITH source AS (
    SELECT * FROM {{ target.catalog }}.{{ target.schema }}.raw_orders
)

SELECT
    order_id,
    customer_id,
    order_date,
    LOWER(status) AS status,
    amount,
    -- Yahan hum macros/pricing.sql function ko use kar rahe hain (10% discount)
    {{ calculate_discount('amount', 0.1) }} AS discounted_amount
FROM source