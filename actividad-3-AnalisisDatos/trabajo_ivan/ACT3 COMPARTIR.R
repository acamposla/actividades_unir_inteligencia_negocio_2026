# ACTIVIDAD 3 - ADVENTUREWORKS

# CARGAR LAS LIBRERIAS Y EL DATASET
library(tidyverse)
library(ggplot2)
library(readxl)
library(lubridate)
library(broom)
library(forecast)
library(knitr)
library(tinytex)

setwd("C:\\Users\\ivang\\OneDrive\\Escritorio\\R\\Actividad03_ADMN")

data_adventureworks <- read_xlsx("C:\\Users\\ivang\\OneDrive\\Escritorio\\R\\Actividad03_ADMN\\DataSet SQL_Act3_ADMN.xlsx")
view(data_adventureworks)

excel_sheets("C:\\Users\\ivang\\OneDrive\\Escritorio\\R\\Actividad03_ADMN\\DataSet SQL_Act3_ADMN.xlsx")

data_adventureworks <- read_excel("C:\\Users\\ivang\\OneDrive\\Escritorio\\R\\Actividad03_ADMN\\DataSet SQL_Act3_ADMN.xlsx", sheet = "Var Discreta Adq Bicicleta")
view(data_adventureworks)

# 1. TIPO DE VARIABLES Realice un análisis descriptivo de las variables de la 
# base de datos (estadística descriptiva, correlación)
str(data_adventureworks)

# factorizar las variables 
data_adventureworks <- data_adventureworks %>%
  mutate_if(is.character,as.factor)

data_adventureworks <- data_adventureworks %>%
  mutate(
    Bici_siono   = factor(BikePurchase, labels = c("No", "Si")),
    Casa_siono = factor(HomeOwnerFlag, labels = c("No", "Si")),
  )

data_adventureworks$CustomerID <- as.factor(data_adventureworks$CustomerID)
data_adventureworks$PersonID <- as.factor(data_adventureworks$PersonID)

# Hay un total de 18484 registros y 19 variables.
# todas las variables son de texto y numero. 

summary(data_adventureworks)

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

# CORRELACION 

data_adventureworks %>%
  select(where(is.numeric)) %>%  
  cor(use = "complete.obs")     

# El Total Amount se correlaciona con Bike Purchase en 0.72447247 lo que indica una
# correlacion fuerte y positiva (cuantas mas bicicletas, mas se factura).
# Con Age en -0.04927731, es una variable independiente, al igual que con Total
# Children (-0.04927731), con Home owner (0.028746071) y Cars Owned (-0.044746701)

# 2 y 3. LOGIT Y ARBOL DE DECISION

data_adventureworks$NumberCarsOwned <- as.factor(data_adventureworks$NumberCarsOwned)
data_adventureworks$TotalChildren <- as.factor(data_adventureworks$TotalChildren)
data_adventureworks$HomeOwnerFlag <- as.factor(data_adventureworks$HomeOwnerFlag)

str(data_adventureworks)

# A. LOGIT con semilla, modelo, accuracy, matriz de confusion

set.seed(123)

test <- sample(1:nrow(data_adventureworks), size = 0.8 * nrow(data_adventureworks))

train_adventure <- data_adventureworks[test, ]

estimate_adventure <- data_adventureworks[-test, ]

# MODELO LOGIT
modelo_logit <- glm(BikePurchase ~ Age + MaritalStatus + Gender + TotalChildren + NumberCarsOwned + Occupation,
                    data = train_adventure,
                    family = "binomial")

pred_logit_prob <- predict(modelo_logit, newdata = estimate_adventure, type = "response")

pred_logit_final <- ifelse(pred_logit_prob > 0.5, "1", "0")

accuracy_logit <- mean(pred_logit_final == estimate_adventure$BikePurchase)
print(accuracy_logit)

# la accuracy del logit es del 60,99%

matriz_logit <- table(Predicho = pred_logit_final, Real = estimate_adventure$BikePurchase)
print(matriz_logit)

# El modelo acierta 1185 verdaderos negativos y 1070 verdaderos positivos.
# Falla en 709 falsos positivos, al final no compraron bicicletas.
# Falla en 733 falsos negativos, al final si compraron bicicletas.

# ARBOL DE DECISION
library(rpart) # para hacer el arbol
modelo_arbol <- rpart(BikePurchase ~ Age + MaritalStatus + Gender + TotalChildren + NumberCarsOwned + Occupation,
                      data = train_adventure,
                      method = "class")

library(rpart.plot) # para dibujar el arbol
rpart.plot(modelo_arbol, type = 2, extra = 104,
           main = "Árbol de Decisión: Predicción de Bike Purchase",
           under = TRUE, faclen = 0)

# El árbol de decisión identifica NumberCarsOwned como la variable más influyente
# por encima de factores como la edad o el numero de hijos.

pred_arbol <- predict(modelo_arbol, newdata = estimate_adventure, type = "class")

accuracy_arbol <- mean(pred_arbol == estimate_adventure$BikePurchase)
print(accuracy_arbol)

# la accuracy del arbol es de 63.88%

# Matriz de confusión
matriz_arbol <- table(Predicho = pred_arbol, Real = estimate_adventure$BikePurchase)

print(matriz_arbol)

# El arbol acierta 1438 verdaderos negativos y 924 verdaderos positivos.
# Falla en 456 falsos positivos, al final no compraron bicicleta.
# Falla en 879 falsos negativos, al final si compraron bicicletas.


# El arbol respecto al logit tiene mayor accuracy  y da menos falsos positivos.