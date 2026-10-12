{{ config(materialized='view') }}

WITH source AS (
    SELECT * FROM {{ target.catalog }}.{{ target.schema }}.raw_customers
)

SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM source