




getwd()
setwd("C:/Users/Leticia/Desktop/EXAMEN DATOS MASIVOS")

View(datos)
### ¿Existen celdas vacías en la base de datos?

colSums(is.na(datos))    
# No existen celdas vacías.

View(datos) # inspección visual
names(datos) 
summary(datos)
### ¿Cuántas personas NO usan tarjeta de crédito y qué porcentaje suponen sobre el total?

table(datos$usa_tarjeta_credito == "No")

# No usan tarjeta de crédito 385 clientes
prop.table(table(datos$usa_tarjeta_credito == "No")
)
# Es una proporción del 38.5%

# ¿Cuántos clientes tienen un ingreso mensual mayor de 3500 dólares?
table(datos$ingreso_mensual >3500)
# 31 clientes tienen un ingreso mensual mayor a 3500 USD.

# ¿Cuántas personas que usan tarjeta de crédito respondieron a la campaña?


library(dplyr)

datosfiltrado<-datos%>% filter(usa_tarjeta_credito == "Sí")     
dim(datosfiltrado)
# 615 clientes usaron tarjeta.
datosfiltrado1<-datos%>% filter(respondio_campaña == "Sí")    
dim(datosfiltrado1)
# 200 clientes respondieron sí a la campaña
datosfiltrado2 <- datos%>% filter (usa_tarjeta_credito == "Sí") %>% filter(respondio_campaña == "Sí")
dim(datosfiltrado2)
# 170 usuarios que usan tarjeta de crédito respondieron a la campaña.

#¿Cuál es el ingreso medio mensual de los hombres y mujeres con educación secundaria?

datosfiltrado3<-datos%>% filter(educacion == "Secundaria")
mean(datosfiltrado3$ingreso_mensual) 
# El ingreso medio mensual de los hombres y mujeres con educación secundaria es de 2019,24USD

# ¿Cuántos clientes respondieron afirmativamente a la campaña con educación secundaria?

library(dplyr)
datosfiltrado4<-datos%>% filter(respondio_campaña == "Sí")     
datosfiltrado5<-datos%>% filter(educacion == "Secundaria")
datosfiltrado6 <- datos%>% filter (respondio_campaña == "Sí") %>% filter(educacion == "Secundaria")
dim(datosfiltrado6)
# 80 clientes que respondieron afirmativamente a la campaña son de nivel de estudios Secundaria

#¿Cuál es la edad media de las mujeres?
datosfiltrado7<-datos%>% filter(genero == "Femenino")

mediaedadmujeres<-mean(datosfiltrado7$edad)
mediaedadmujeres
# La edad media de las mujeres es de 44.77 años.

#¿Entre qué variables existe más correlación? ¿Consideras dicha correlación grande?

datos_num <- datos %>% select(where(is.numeric))
cor(datos_num, use = "complete.obs")
# Se revisa la correlación entre las variables numéricas y ninguna está próxima a 
# 0.5 ó -0.5 con lo que no se considera que la correlación entre estas variables
# sea fuerte. 

#¿Qué porcentaje de personas respondió afirmativamente?
  
table(datos$respondio_campaña == "Sí")
prop.table(table(datos$respondio_campaña == "Sí")
)
# El 20% de los clientes respondieron afirmativamente a la campaña. 

# Cree una variable que asigne un 0 a los individuos que no respondieron a la campaña y un 1 al resto

datos$nueva_respondiocampaña <- ifelse(datos$respondio_campaña == "Sí", 1, 0)

#Realice una regresión logística utilizando como variable dependiente si el individuo respondió (o no) a la campaña, y como variables independientes el resto (excepto la variable edad) ¿Qué variables son significativas?

set.seed(123)   
idx <- sample(seq_len(nrow(datos)), size = 0.8*nrow(datos))

train <- datos[idx, ]
test <- datos[-idx, ]

modelo_logit <- glm(nueva_respondiocampaña ~ genero + educacion + ingreso_mensual +
                    usa_tarjeta_credito + visitas_web + compras_previas,
                    data = train,
                    family = binomial)

summary(modelo_logit)
 
# Las variables significativas estadísticamente de este modelo logit son Ingreso Menual, usa tarjeta
# de crédito, visitas wen y compras previas. 

# Determine la probabilidad de responder afirmativamente de un individuo que usa tarjeta de crédito frente al que no la usa.

Probabilidad_respondersi <- predict(
  modelo_logit,
  newdata = data.frame(
    usa_tarjeta_credito == 'Sí',
  
  type = "response"
)



# ¿Cuánto aumenta la probabilidad de responder afirmativamente si el ingreso mensual aumenta en 150 dólares?
exp(coef(modelo_logit))

# “Un aumento de una unidad en ingreso mensual multiplica las odds de responder sí  por 1.0012. Si aumenta 150
# dólares, multiplica las odds de responder sí en (res1.00120*150)


# Calcule la matriz de confusión y determine la métrica de exactitud.

prob <- predict(modelo_logit,
                newdata = test,
                type = "response")
pred <- ifelse(prob >= 0.5, 1, 0)

table(Predicho = pred,
      Real = test$nueva_respondiocampaña)   
mean(pred == test$nuevaraintoday)   
  
# En la matriz de confusión vemos que el modelo clasifica no cuando
# realmente han respondido no 151 clientes; el modelo clasifica sí cuando han respondido
# sí realmente 25.
library(caret)


confusionMatrix(
  factor(pred, levels = c(1,0)),
  factor(test$nueva_respondiocampaña, levels = c(1,0))
)

# El modelo tiene una métrica de exactitud de 0.88, tiene un 88%
# de clasificaciones correctas.

# Con el modelo de regresión logística, determine la probabilidad de haber respondido la campaña de un individuo de género femenino, que usa tarjeta de crédito, con 3 compras previas y 5 visitas web y con un ingreso mensual igual a 2200 dólares.


Probabilidad_respondiocampaña <- predict(
  modelo_logit,
  newdata = data.frame(
    genero = "Femenino",
    usa_tarjeta_credito = "Sí",
    compras_previas = 3,
    visitas_web = 5,
    ingreso_mensual =2200,
    educacion = "Universitaria"
  ),
  type = "response"
)             

Probabilidad_respondiocampaña
# Como no indica nivel de estudios voy a suponer universitarios ceteris paribus resto
# de condiciones. La prob de haber respondido a la campaña sí individuo con las características
# indicadas es 0.505.

# Con las mismas variables que en el modelo de regresión logística, estime un árbol de decisión. Determine el porcentaje (sobre el total) de aquellos individuos que hicieron compras menores de 5, que sí usaron tarjeta de crédito y que tuvieron un ingreso menor de 2500 dólares (dibuje el árbol resultante para ayudarse).

library(rpart)
library(rpart.plot)
modelo_arbol <- rpart(nueva_respondiocampaña ~ genero + educacion + ingreso_mensual +
                        usa_tarjeta_credito + visitas_web + compras_previas, data = train, method = "class")

rpart.plot(modelo_arbol)
          
modelo_arbol









# Mediante el análisis clúster determine el número óptimo de clústeres en el que se puede dividir la base de datos. ¿Cómo podría interpretar cada clúster obtenido? Razone la respuesta.


datos_clust <- datos %>% select(edad, ingreso_mensual, usa_tarjeta_credito, visitas_web, compras_previas)

datos_cluster <- datos %>% select(where(is.numeric))

library(dplyr)
library(NbClust)
library(factoextra)
datos_cluster <- datos %>% select(where(is.numeric))
datos_scaled <- scale(datos_cluster)
set.seed(123)
resultado_nb <- NbClust(
  datos_scaled,
  min.nc = 2,
  max.nc = 8,
  method = "kmeans"
)
resultado_nb$Best.nc
# Según a regla de la mayoría de los índices el número de clúster más adecuado
# es 2.

set.seed(123)
cluster_final <- kmeans(datos_cluster, centers = 2, nstart = 25)   

cluster_final$centers
# Interpretación de los clústers obtenidos: Los clientes del clúster 1 son los que
# tienen 44.28 años de media de edad, con ingresos medios de 2681 USD, unas 4.95 visitas
# web y 1.88 compras previas medias. 
# Los clientes del clúster dos son los que tienen de unos 44.71 años de media,
# unos ingresos mensuales de aproximadamente 1428 USD, con media de 4.96 visitas web
# y 1.90 compras previas. El clúster 1 está agrupando a los clientes con mayor poder
# adquisitivo.

fviz_cluster(cluster_final, data = datos_cluster)
