{% macro calculate_discount(price, discount_pct) %}
    ({{ price }} - ({{ price }} * {{ discount_pct }}))
{% endmacro %}