

  SELECT * FROM "DB_CREDIT"."PUBLIC"."APLICATION_TEST"
LIMIT
  10;


  WITH aplicatioperfil_teste AS (

    SELECT 
        test.SK_ID_CURR,
        test.NAME_CONTRACT_TYPE AS NOME_CONTATO,
        test.CODE_GENDER AS CODIGO_GENERO,
        test.NAME_INCOME_TYPE AS TIPO_IMPRESTIMO,
        test.NAME_FAMILY_STATUS AS ESTADO_FAMILIAR,
        test.AMT_INCOME_TOTAL AS QUANTIDADE_IMPRESTIMO,
        test.NAME_EDUCATION_TYPE AS NOME_FORMACAO,
        test.DAYS_BIRTH DIA_ANIVERSARIO,
        DATEDIFF(YEAR, DATEADD(DAY, -ABS(DAYS_BIRTH), CURRENT_DATE()), CURRENT_DATE()) AS IDADE,
        test.DAYS_EMPLOYED AS DIA_EMPREGADO,
        DATEDIFF(YEAR, DATEADD(DAY, -ABS(DAYS_EMPLOYED), CURRENT_DATE()), CURRENT_DATE()) AS ANOS_EMPREGADO,
        test.OCCUPATION_TYPE AS TIPO_OCUPACAO
        

    FROM "DB_CREDIT"."PUBLIC"."APLICATION_TEST" AS test
  );


-- Criar a tabela dimensão para analisar os dados de perfil do clientes aplication - teste
  CREATE OR REPLACE TABLE DB_CREDIT.PUBLIC.DIM_APLICATION_PERFIL (
    SK_ID_CURR INT PRIMARY KEY,
    NOME_CONTATO STRING,
    CODIGO_GENERO STRING,
    TIPO_IMPRESTIMO STRING,
    ESTADO_FAMILIAR STRING,
    QUANTIDADE_IMPRESTIMO FLOAT,
    NOME_FORMACAO STRING,
    DIA_ANIVERSARIO INT,
    IDADE INT,
    DIA_EMPREGADO INT,
    ANOS_EMPREGADO INT,
    TIPO_OCUPACAO STRING
);


- Criar a CTE para analisar os perfis e em seguida inseris os dados para a tabela dimensão 

WITH aplicatioperfil_teste AS (
    SELECT 
        test.SK_ID_CURR,
        test.NAME_CONTRACT_TYPE AS NOME_CONTATO,
        test.CODE_GENDER AS CODIGO_GENERO,
        test.NAME_INCOME_TYPE AS TIPO_IMPRESTIMO,
        test.NAME_FAMILY_STATUS AS ESTADO_FAMILIAR,
        test.AMT_INCOME_TOTAL AS QUANTIDADE_IMPRESTIMO,
        test.NAME_EDUCATION_TYPE AS NOME_FORMACAO,
        test.DAYS_BIRTH AS DIA_ANIVERSARIO,
        DATEDIFF(YEAR, DATEADD(DAY, -ABS(test.DAYS_BIRTH), CURRENT_DATE()), CURRENT_DATE()) AS IDADE,
        test.DAYS_EMPLOYED AS DIA_EMPREGADO,
        DATEDIFF(YEAR, DATEADD(DAY, -ABS(test.DAYS_EMPLOYED), CURRENT_DATE()), CURRENT_DATE()) AS ANOS_EMPREGADO,
        test.OCCUPATION_TYPE AS TIPO_OCUPACAO
    FROM "DB_CREDIT"."PUBLIC"."APLICATION_TEST" AS test
);

-- Inserir os dados na tabela dimensão 

INSERT INTO DB_CREDIT.PUBLIC.DIM_APLICATION_PERFIL
(
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
)
SELECT 
    test.SK_ID_CURR,
    test.NAME_CONTRACT_TYPE AS NOME_CONTATO,
    test.CODE_GENDER AS CODIGO_GENERO,
    test.NAME_INCOME_TYPE AS TIPO_IMPRESTIMO,
    test.NAME_FAMILY_STATUS AS ESTADO_FAMILIAR,
    test.AMT_INCOME_TOTAL AS QUANTIDADE_IMPRESTIMO,
    test.NAME_EDUCATION_TYPE AS NOME_FORMACAO,
    test.DAYS_BIRTH AS DIA_ANIVERSARIO,
    DATEDIFF(YEAR, DATEADD(DAY, -ABS(test.DAYS_BIRTH), CURRENT_DATE()), CURRENT_DATE()) AS IDADE,
    test.DAYS_EMPLOYED AS DIA_EMPREGADO,
    DATEDIFF(YEAR, DATEADD(DAY, -ABS(test.DAYS_EMPLOYED), CURRENT_DATE()), CURRENT_DATE()) AS ANOS_EMPREGADO,
    test.OCCUPATION_TYPE AS TIPO_OCUPACAO
FROM "DB_CREDIT"."PUBLIC"."APLICATION_TEST" AS test;



SELECT * FROM DB_CREDIT.PUBLIC.DIM_APLICATION_PERFIL





