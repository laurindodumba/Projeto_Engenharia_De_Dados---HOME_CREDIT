## PROJETO DE ENGENARIA DE DADOS - HOME CREDIT


# Descrição Do projeto

Objetivo principal deste projeto é de implementar uma solução de pipelines que faça  o processo de extração, transformação e armzenamento dos dados históricos de insuficiência de crédito ou inexistente de uma população de baixa renda. E que infelizmente essa população acaba sendo aproveitada por credores não confiáveis.

A HOME Credit vem buscando desenvolver estratégias para incluir esta população ainda não bancarizada.
Para garantir que essa população carente tenha uma experiência de empréstimo positiva, a Home Credit faz uso de uma variedade de dados alternativos — incluindo informações de telecomunicações e transacionais — para prever as habilidades de pagamento de seus clientes.
E para tal necessita de ter os dados organizados e tratados para que depois possam ser criados modelos estatísticos e de aprendizado de máquinas para gerar previsões e ajuda-los a garantir que haja a inclusão de novos clientes, diminuindo desta forma a taxa de rejeição.


- A base de dados e a inspiração do projeto foi extraída no Kaggle: https://www.kaggle.com/competitions/home-credit-default-risk/overview


## Estrutura do Projeto:
- Armazenamento dos dados   bruto -> S3.
- Tratamento dos dados e criação das tabelas fontes -> Snowflake.
- Desenvolvimento análitico -> DBT

## Configuração do ambiente:
Pré-requesitos;
- Conta no Snowflake -> https://spn.snowflake.com/s/login/

- Conta AWS -> https://aws.amazon.com/pt/console/

- Conta DBT -> https://www.getdbt.com/signup



## Arquitetura:

![image](https://github.com/user-attachments/assets/a8d20b56-5285-416b-b4d9-d451d88a951d)





## DBT
Desenvolvimento de modelos dbt através da sintaxe SQL usando framework jinja2. O resultado é a materialização objetos (views) no banco de dados do snowflake para que o usuário possa realizar consultas. 

![image](https://github.com/user-attachments/assets/986d940f-7fe7-4c2d-93e6-61911761c841)



## Autor:
Laurindo Dumba
