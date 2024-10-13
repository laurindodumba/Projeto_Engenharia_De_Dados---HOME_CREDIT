-- models/staging/stg_aplication_test.sql

with aplicatioperfil_teste as (
    select 
        test.SK_ID_CURR,
        test.NAME_CONTRACT_TYPE AS NOME_CONTATO,
        test.CODE_GENDER AS CODIGO_GENERO,
        test.NAME_INCOME_TYPE AS TIPO_IMPRESTIMO,
        test.NAME_FAMILY_STATUS AS ESTADO_FAMILIAR,
        test.AMT_INCOME_TOTAL AS QUANTIDADE_IMPRESTIMO,
        test.NAME_EDUCATION_TYPE AS NOME_FORMACAO,
        test.DAYS_BIRTH AS DIA_ANIVERSARIO,
        datediff(year, dateadd(day, -abs(test.DAYS_BIRTH), current_date()), current_date()) as IDADE,
        test.DAYS_EMPLOYED AS DIA_EMPREGADO,
        datediff(year, dateadd(day, -abs(test.DAYS_EMPLOYED), current_date()), current_date()) as ANOS_EMPREGADO,
        test.OCCUPATION_TYPE AS TIPO_OCUPACAO
    from {{ source('db_credit', 'APLICATION_TEST') }} as test
)

select * from aplicatioperfil_teste
