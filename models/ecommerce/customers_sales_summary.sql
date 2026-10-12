{{ config(materialized='table') }}

WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),

orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
)

SELECT
    c.customer_id,
    c.full_name,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE WHEN o.status = 'completed' THEN o.amount ELSE 0 END) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name