# DETERMINAR A CATEGORIA COM MELHOR DESEMPENHO DE VENDAS - APLICAR FILTRO DE DATA
  
# AS LOJAS PARCEIRAS COM MAIOR NÚMERO DE VENDAS E RECEITA
# AS REGIÕES QUE MAIS COMPRA. PLOTAGEM DE MAPAS


# IMPORTAR 
#setwd("~/Jupiter_Analytics/model")
library(dplyr)
library(priceR)
# ORDER_ID
olist_orders_dataset <- read.csv("model/data/olist_orders_dataset.csv")
olist_order_reviews_dataset <- read.csv("model/data/olist_order_reviews_dataset.csv")
olist_order_payments_dataset <- read.csv("model/data/olist_order_payments_dataset.csv")
olist_customers_dataset <- read.csv("model/data/olist_customers_dataset.csv")

# 
olist_order_items_dataset <- read.csv("model/data/olist_order_items_dataset.csv")
olist_products_dataset <- read.csv("model/data/olist_products_dataset.csv")
olist_sellers_dataset <- read.csv("model/data/olist_sellers_dataset.csv")
olist_geolocation_dataset <- read.csv("model/data/olist_geolocation_dataset.csv")




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

################################################################################
# NÚMEROS DE LOJAS
#nlojas <- nrow(olist_sellers_dataset)

lojas <- add_count(olist_sellers_dataset)%>%
  filter(n >1)
#
nlojas <- max(lojas$n)

# AVALIAÇÃO

meanAvaliacao <- mean(olist_order_reviews_dataset$review_score)
meanAvaliacao <- round(meanAvaliacao, 2)

# RECEITA
receita <- sum(category_frequency$Valor)
#format_dollars(receita)

# DESPESAS
despesas <- round(600)

evolucaoVendas <- products%>%
  full_join(
    olist_orders_dataset %>%
      dplyr::select(order_id, order_purchase_timestamp),
    by = c("order_id")
  )

vendasCategoria <- evolucaoVendas %>% 
  group_by(product_category_name)%>%
  summarise(frequencia = n(), Valor = sum(price))%>%
  arrange(desc(frequencia))

#vendasCategoria <- as.data.frame(vendasCategoria)

#vendasCategoria$data <- as.Date(paste(vendasCategoria$data))



teste <- vendasCategoria%>%slice_head(n = 5)

# ggplot(teste, aes(x = teste$product_category_name, y = teste$frequencia))+
#   geom_bar(stat = "identity")
