-- Agar yeh query koi row return karti hai, toh 'dbt test' fail ho jayega
SELECT *
FROM {{ ref('stg_orders') }}
WHERE amount < 0