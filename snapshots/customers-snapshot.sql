{% snapshot customers_snapshot %}

{{
    config(
      target_database='dbt_catalogue',
      target_schema='dbt_schema',
      unique_key='customer_id',
      strategy='check',
      check_cols=['full_name'],
    )
}}

SELECT customer_id, full_name 
FROM {{ ref('stg_customers') }}

{% endsnapshot %}