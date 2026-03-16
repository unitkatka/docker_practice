
{{
  config(
    materialized = 'incremental',
    incremental_strategy = 'merge',
    unique_key = ['book_ref'],
    tags = ['bookings'],
    merge_update_columns = ['total_amount'],
    on_schema_change = 'append_new_columns'
  )
}}
select
    book_ref,
    book_date,
    total_amount::INT AS total_amount,
    1 AS some_amount
from {{ref('stg_flights__bookings') }}
{% if is_incremental() %}
  WHERE book_date > (SELECT MAX(book_date) FROM {{ source('demo-src', 'bookings') }}) - INTERVAL '97 DAY'

{% endif %}