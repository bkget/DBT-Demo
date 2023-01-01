-- Hooks macro
{% macro insert_audits(action_name) %}
    
    INSERT INTO jaffle_shop.public_analytics.dbt_audits (audit_type)
    
    VALUES ('{{action_name}}');

    COMMIT;

{% endmacro %}