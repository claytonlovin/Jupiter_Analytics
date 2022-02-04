# DETERMINAR A CATEGORIA COM MELHOR DESEMPENHO DE VENDAS - APLICAR FILTRO DE DATA
  
# AS LOJAS PARCEIRAS COM MAIOR NÚMERO DE VENDAS E RECEITA
# AS REGIÕES QUE MAIS COMPRA.


# IMPORTAR 
library(dplyr)
# ORDER_ID
olist_orders_dataset <- read.csv("data/olist_orders_dataset.csv")
olist_order_reviews_dataset <- read.csv("data/olist_order_reviews_dataset.csv")
olist_order_payments_dataset <- read.csv("data/olist_order_payments_dataset.csv")
olist_customers_dataset <- read.csv("data/olist_customers_dataset.csv")

# 
olist_order_items_dataset <- read.csv("data/olist_order_items_dataset.csv")
olist_products_dataset <- read.csv("data/olist_products_dataset.csv")
olist_sellers_dataset <- read.csv("data/olist_sellers_dataset.csv")
olist_geolocation_dataset <- read.csv("data/olist_geolocation_dataset.csv")


# PEGAR A FREQUÊNCIA DAS CATGORIAS E ORGANIZAR UMA TABELA POR PREÇO.
# JOIN ENTRE A TABLE_PRODUCT E TABLE_ITEMS


products <- olist_products_dataset %>% 
  inner_join(
    olist_order_items_dataset,
    by = c("product_id")
    )

category_frequency <- products %>% 
  group_by(product_category_name)%>%
  summarise(frequencia = n(), Valor = sum(price))%>%
  arrange(desc(frequencia))


