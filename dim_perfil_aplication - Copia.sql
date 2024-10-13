create or replace view DB_CREDIT.PUBLIC.dim_aplication_perfil as (
    -- models/stage/dim_aplication_perfil.sql

    with aplicatioperfil_teste as (
        select 
            br.SK_ID_CURR,
            br.NAME_CONTRACT_TYPE AS NOME_CONTATO,
            br.CODE_GENDER AS CODIGO_GENERO,
            br.NAME_INCOME_TYPE AS TIPO_IMPRESTIMO,
            br.NAME_FAMILY_STATUS AS ESTADO_FAMILIAR,
            br.AMT_INCOME_TOTAL AS QUANTIDADE_IMPRESTIMO,
            br.NAME_EDUCATION_TYPE AS NOME_FORMACAO,
            br.DAYS_BIRTH AS DIA_ANIVERSARIO,
            datediff(year, dateadd(day, -abs(br.DAYS_BIRTH), current_date()), current_date()) as IDADE,
            br.DAYS_EMPLOYED AS DIA_EMPREGADO,
            datediff(year, dateadd(day, -abs(br.DAYS_EMPLOYED), current_date()), current_date()) as ANOS_EMPREGADO,
            br.OCCUPATION_TYPE AS TIPO_OCUPACAO
        from {{ ref('stg_aplication_test') }} AS br  -- Usando ref para referência ao modelo de staging
    )

    select
        SK_ID_CURR,
        NOME_CONTATO,
        CODIGO_GENERO,
        TIPO_IMPRESTIMO,
        ESTADO_FAMILIAR,
        QUANTIDADE_IMPRESTIMO,
        NOME_FORMACAO,
        DIA_ANIVERSARIO,
        IDADE,
        DIA_EMPREGADO,
        ANOS_EMPREGADO,
        TIPO_OCUPACAO
    from aplicatioperfil_teste
);
