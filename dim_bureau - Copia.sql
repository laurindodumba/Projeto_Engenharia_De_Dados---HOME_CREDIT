-- models/dimensions/dim_bureau.sql

select
    SK_ID_CURR,
    CREDIT_ACTIVE,
    CREDIT_CURRENCY,
    DAYS_CREDIT,
    DAYS_CREDIT_ENDDATE,
    CREDIT_TYPE,
    DAYS_CREDIT_UPDATE,
    AMT_ANNUITY
from {{ ref('stg_bureau') }}  -- Referência ao modelo staging
