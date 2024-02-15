
-- Use the `ref` function to select from other models
{{ config(materialized='table',schema='stg') }}

WITH stg_gs_booking_additional as (
	select * from {{ source('contraloria', 'gs_booking_additional') }}
)

select * from stg_gs_booking_additional
