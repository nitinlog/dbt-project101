{{
    config(
        materialized='incremental',
        on_schema_change='fail'
    )
}}
with src_Reviews as (

    select * from {{ref('src_reviews')}}
)

select * from src_reviews
where review_text is not null

{% if is_incremental() %}
    AND review_date > (select max(review_date)from {{this}})
{% endif %}