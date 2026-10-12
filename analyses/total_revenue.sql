SELECT SUM(amount) AS grand_total 
FROM {{ ref('stg_orders') }}

