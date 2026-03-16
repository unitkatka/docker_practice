
{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'append',
    tags = ['bookings']
  )
}}
select
    book_ref,
    book_date,
    total_amount
from {{ref('stg_flights__bookings') }}
{% if is_incremental() %}
  WHERE  ('0x' || book_ref)::bigint > (SELECT MAX(('0x' || book_ref)::bigint) FROM {{ this }})
{% endif %}