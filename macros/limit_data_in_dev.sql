{% macro limit_data_in_dev(column_name, dev_day_of_data=3) -%}

    {%- if target.name == 'dev' -%}

    -- WHERE {{column_name}} >= dateadd('day', -{{dev_day_of_data}}, current_timestamp)  -- dateadd() function works with snowflake and not in postgres
       WHERE {{column_name}} >= current_timestamp - interval '{{dev_day_of_data}} day'
       
    {%- endif -%}

{%- endmacro %}