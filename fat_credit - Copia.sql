-- models/fat_credit.sql

with transacoes as (
    select 
        a.SK_ID_CURR,
        current_date() as DATA_TRANSACAO,
        sum(a.QUANTIDADE_IMPRESTIMO) as VALOR_TRANSACAO
    from {{ ref('dim_bureau') }} as b
    join {{ ref('dim_aplication_perfil') }} as a on b.SK_ID_CURR = a.SK_ID_CURR
    group by a.SK_ID_CURR
)

select 
    row_number() over () as ID_TRANSACAO,
    SK_ID_CURR,
    DATA_TRANSACAO,
    VALOR_TRANSACAO
from transacoes
