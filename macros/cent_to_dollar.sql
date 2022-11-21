{% macro cent_to_dollar(column_name, decimal_point=2) -%}

    ROUND(1.0*{{ column_name }}/100, {{ decimal_point }})
    
{%- endmacro %}