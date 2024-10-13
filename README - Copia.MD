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

![alt text](arquitetura.PNG)




## DBT

![alt text](<imagem dbt.PNG>)


![alt text](img_dbt.PNG)


## Autor:
Laurindo Dumba