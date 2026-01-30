getwd()
setwd("D:/BI/Asignaturas/Datos masivos para el negocio/ACTIVIDADES/ACTIVIDAD 3 02.02.2026")
getwd()
library(readxl)
datos <- read_excel("DataSet SQL_Act3_ADMN.xlsx")

excel_sheets("DataSet SQL_Act3_ADMN.xlsx")
library(readxl)



datos <- read_excel(
  "DataSet SQL_Act3_ADMN.xlsx",
  sheet = "Var Discreta Adq Bicicleta"
)


View(datos)


library(psych) 
library(car) 
library(Hmisc) 
library(ggplot2) 
library(dplyr) 
library(skimr)
library(tidyverse)    
library(lubridate)    
library(ggplot2)      
library(psych)        
library(forecast) 
library(corrplot)

install.packages("fastDummies")
library(fastDummies)
library(rpart)
library(rpart.plot)
library(caret)
library(factoextra)
library(NbClust)
install.packages("caret")
library(caret)
library(dplyr)


dim(datos)  # 18484 filas y 19 columnas
View(datos)
head(datos)
str(datos) # 

datos <- datos %>%
  mutate_if(is.character,as.factor)

datos <- datos %>%
  mutate(
    Bici_siono   = factor(BikePurchase, labels = c("No", "Si")),
    Casa_siono = factor(HomeOwnerFlag, labels = c("No", "Si")),
  )

datos$CustomerID <- as.factor(datos$CustomerID)
datos$PersonID <- as.factor(datos$PersonID)


View(datos)
dim(datos) # # Hay un total de 18484 registros y 19 variables.
# todas las variables son de texto y número. 



unique(datos)
summary(datos)

# El analisis de variables solo aplica a algunas de las variables. Destaco el
# Total Amount, Bike Purchase.
# La media y la mediana de Total amount estan alejadas entre si porque el precio
# entre las biciletas y los accesorios es muy dispar. La media y la mediana estan 
# alejadas entre si con sesgo a la derecha, dado que la media es mayor a la mediana. 
# Bike Purchase arroja una media de 0.494 lo que indica que esta en medio entre 0 
# y 1 por lo que la cantidad vendida de bicicletas y accesorios esta muy 
# equilibrada. En la edad, la media y mediana estan parejas, 57 y 58.42 años, y
# la minima y máxima son de 40 y 66 años. En Total children vamos de 0 hijos a 
# 5 hijos y la media y la mediana tambien estan muy cerca, 1,84 y 2.


# Correlaciona lo numérico (por esto hay que hacer factor antes,
# después str)

datos %>%
  select(where(is.numeric)) %>%  
  cor(use = "complete.obs")    


# El Total Amount se correlaciona con Bike Purchase en 0.72447247 lo que indica una
# correlacion fuerte y positiva (cuantas mas bicicletas, mas se factura).
# Con Age en -0.04927731, es una variable independiente, al igual que con Total
# Children (-0.04927731), con Home owner (0.028746071) y Cars Owned (-0.044746701)


# 2 y 3. LOGIT Y ARBOL DE DECISION

datos$NumberCarsOwned <- as.factor(datos$NumberCarsOwned)
datos$TotalChildren <- as.factor(datos$TotalChildren)
datos$HomeOwnerFlag <- as.factor(datos$HomeOwnerFlag)

str(datos)

# A. LOGIT con semilla, modelo, accuracy, matriz de confusion

set.seed(123)

test <- sample(1:nrow(datos), size = 0.8 * nrow(datos))

train_datos <- datos[test, ]

estimate_datos <- datos[-test, ]

# MODELO LOGIT
modelo_logit <- glm(BikePurchase ~ Age + MaritalStatus + Gender + TotalChildren + NumberCarsOwned + Occupation,
                    data = train_datos,
                    family = "binomial")

pred_logit_prob <- predict(modelo_logit, newdata = estimate_datos, type = "response")

pred_logit_final <- ifelse(pred_logit_prob > 0.5, "1", "0")

accuracy_logit <- mean(pred_logit_final == estimate_datos$BikePurchase)
print(accuracy_logit)

# la accuracy del logit es del 60,99%

matriz_logit <- table(Predicho = pred_logit_final, Real = estimate_datos$BikePurchase)
print(matriz_logit)

# El modelo acierta 1185 verdaderos negativos y 1070 verdaderos positivos.
# Falla en 709 falsos positivos, al final no compraron bicicletas.
# Falla en 733 falsos negativos, al final si compraron bicicletas.


# Matriz de confusión


confusionMatrix(
  factor(pred_logit_final, levels = c(0,1)),
  factor(estimate_datos$BikePurchase, levels = c(0,1))
)
# ARBOL DE DECISION
library(rpart) # para hacer el arbol
modelo_arbol <- rpart(BikePurchase ~ Age + MaritalStatus + Gender + TotalChildren + NumberCarsOwned + Occupation,
                      data = train_datos,
                      method = "class")

library(rpart.plot) # para dibujar el arbol
rpart.plot(modelo_arbol, type = 2, extra = 104,
           main = "Árbol de Decisión: Predicción de Bike Purchase",
           under = TRUE, faclen = 0)

# El árbol de decisión identifica NumberCarsOwned como la variable más influyente
# por encima de factores como la edad o el numero de hijos.

pred_arbol <- predict(modelo_arbol, newdata = estimate_datos, type = "class")

accuracy_arbol <- mean(pred_arbol == estimate_datos$BikePurchase)
print(accuracy_arbol)

confusionMatrix(
  factor(pred_arbol, levels = c(0,1)),
  factor(estimate_datos$BikePurchase, levels = c(0,1))
)

# la accuracy del arbol es de 63.88%

# Matriz de confusión
matriz_arbol <- table(Predicho = pred_arbol, Real = estimate_datos$BikePurchase)

print(matriz_arbol)




# El arbol acierta 1438 verdaderos negativos y 924 verdaderos positivos.
# Falla en 456 falsos positivos, al final no compraron bicicleta.
# Falla en 879 falsos negativos, al final si compraron bicicletas.


# El árbol presenta un accuracy del 61%, equivalente al obtenido con la reg logística
# y superior al azar. El Kappa 0.22 indica una capacidad predictiva
# moderada. El árbol reduce el número de falsos positivos respecto al logit 
# aunque incrementa los falsos positivos. Esta característica puede ser relevante
# para evitar acciones comerciales innecesarias sobre clientes con baja
# prob de compra. 

# El árbol indica el número de coches en propiedad con la variable más influyente
# en la decisión de compra de bicicletes. La edad del cliente aparece como segundo
# factor, segmentando clientes de mayor a menor propensión de compra. Finalmente, 
# el número de coches permite refinar la clasificación. 





# Usamos toda la muestra. Tipologías de clientes diferentes. Vamos a 
# aplicar el algoritmo k-means sobre el total de la muestra usando 
# variables sociodemográficas. 


# Ap No Supervisado
library(dplyr)


datos_ns <- datos %>%
  select(-BikePurchase)




datos_ns <- datos_ns %>%
  dplyr::mutate(
    Age = datos$Age,
    NumberCarsOwned = datos$NumberCarsOwned,
    TotalChildren = datos$TotalChildren
  )
# VAriables elegidas: Age, NumberCarsOwned, TotalChilden. 

datos_clust <- datos_ns %>%
  select(Age, NumberCarsOwned, TotalChildren)

datos_scaled <- scale(datos_clust)

# Definir el número de clúster mediante el método del codo. 

wss <- sapply(1:10, function(k){
  kmeans(datos_scaled, centers = k, nstart = 10)$tot.withinss
})

plot(1:10, wss, type = "b",
     xlab = "Número de clusters",
     ylab = "Within-cluster sum of squares")

# El codo está en aprox k= 3.

set.seed(123)
modelo_kmeans <- kmeans(datos_scaled, centers = 3)


datos_clust$cluster <- modelo_kmeans$cluster


aggregate(datos_clust[,1:3],
          by = list(Cluster = datos_clust$cluster),
          mean)

# Tres tipologías de clientes bien definidas: 
# Cluster 1: edad media 56 años, coches 0,4, hijos 1.4
# Cluster 2: Edad media 47 años, coches 2, hihos 0.20
# Cluster 3: Edad media 68 años, coches 2.3, hijos 3.2

# Usamos ST Ventas para la serie temporal y sólo la primera columna.

library(readxl)

excel_sheets("DataSet SQL_Act3_ADMN.xlsx")


ventas <- read_excel(
  "DataSet SQL_Act3_ADMN.xlsx",
  sheet = "ST Ventas Totales "
)

head(ventas)
ventas_ts <- ts(ventas[[1]], frequency = 12)

library(forecast)

modelo_hw <- HoltWinters(ventas_ts)

prediccion <- forecast(modelo_hw, h = 2)

prediccion$mean

plot(prediccion)

# Se estiman unas ventas totales de aprx 1.404 millones para el primer mes
# y 1.404,3 para el segundo mes, indicando evolución estable de las ventas a 
# cp. El gráfico de la predicción muestra evolución creciente y estable de las 
# ventas, coherente con la tendencia histórica. 
