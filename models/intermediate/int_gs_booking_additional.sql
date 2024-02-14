{{ config(materialized='table',schema="int_mart") }}


select * from {{ ref('gs_booking_additional')}}
