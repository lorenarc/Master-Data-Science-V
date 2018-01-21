getwd()
??demo()

## EJERCICIO 2.
# Configura RStudio para que permita utilizar Knitr y Markdown. 

install.packages("knitr", dependencies = TRUE)
library(knitr)
  

## EJERCICIO 3: Abre un nuevo script dentro de tu proyecto. Guárdalo con el nombre Ejercicio_03.R y realiza lo 
## siguiente:
# 1.Escribe un comentario al principio que especifique tu nombre y el enunciado del ejercicio.
# 2.Utilizando funciones para vectores, crea un vector que tenga el siguiente contenido. No crees el vector de 
# forma manual.
# vector
# [1] 4 4 4 4 4 1 3 5 7 9 3 7 11
# 3.Piensa qué función podrías utilizar sobre el vector anterior para obtener otro vector como el siguiente. 
# El resultado debe almacenarse en otro vector de nombre vector.dos
# vector.dos
# [1] 8 9 10 12 13
# 4.Extrae los elementos que sean mayores que 5 y almacénalos en otro vector de nombre vector.tres
# vector.tres
# [1] 7 9 7 11
# 5.Ahora realiza lo mismo pero utilizando obligatoriamente la función which() y almacénalo en un vector 
# de nombre vector.cuatro
# vector.cuatro
# [1] 7 9 7 11
# 6.Suponiendo que desconoce la longitud del vector, crea un vector de nombre vector.cinco que almacene todos los 
# elementos desde el primero hasta el penúltimo.
# vector.cinco
# [1] 4 4 4 4 4 1 3 5 7 9 3 7 11

# LORENA RECIO

vector <- c(rep(4,5), seq(1,10,by=2), seq(3,11,by=4))
vector

vector.dos <- which(vector>=5)
vector.dos

vector.tres <- vector[vector>5]
vector.tres

vector.cuatro <- vector[which(vector>5)]
vector.cuatro

length(vector)
vector.cinco <- vector[-length(vector)]
vector.cinco

# EJERCICIO 4: Utilizando la ayuda de la función matrix(), 
# crea una matriz de nombre mimatriz que tenga 6 filas y 8 columnas.
# Rellena la matriz con valores del 1 al 48 por filas.

??matrix
mimatriz <- matrix(data=seq(1:48),
                   nrow=6,
                   ncol=8,
                   byrow=TRUE)
mimatriz

# EJERCICIO 5: 
# 1.Partiendo de la matriz del ejercicio 4, redimensiona la misma a 8 filas 
# por 6 columnas y nómbrala como nuevamatriz.
# 2.Partiendo del vector LETTERS, utilízalo para dar nombre a las columnas de nuevamatriz
# 3.Calcula la suma de las columnas y añade el resultado como una nueva fila a la propia matriz.

nuevamatriz <- t(mimatriz)
nuevamatriz

colnames(nuevamatriz) <- LETTERS[seq(1:6)]
nuevamatriz

rbind(nuevamatriz,colSums(nuevamatriz))

# Prueba con estructuras

x <- c(1,3,4,5,6,7)
contador <- 0

for (val in x)  {
  if (val%%2==0)
    contador =contador+ 1
} 
print(contador)

# EJERCICIO 6: Escribe un código que evalúe el resultado de una operación y muestre por pantalla 
# el resultado si es válido o un mensaje si es NA o NaN.

x <- 0/0
if (is.na(x))  {
  cat("La operación muestra",x, "\n")
}else{
  cat("La operación es correcta")
}

# EJERCICIO 7: 
# 1.Crea una matriz como la que se muestra a continuación, incluyendo los datos y los 
# nombres de las filas y de las columnas.
# 2.Recorre la matriz por filas mostrando por pantalla su contenido. Hazlo con un bucle while y con un bucle for.
# 3.Para calcular el número total de filas y columnas que tiene la matriz utiliza las funciones correspondientes

m <- matrix(data=c(30,178,80,35,175,84),
            nrow = 2,
            ncol = 3,
            dimnames = list(c("Europeos","Americanos"), c("Edad","Altura","Peso")))

filas <- 1
while (filas<=nrow(m)) {
  columnas <- 1
  while (columnas<=ncol(m)) {
    print(m[filas,columnas])
    columnas=columnas+1
  }
  filas=filas+1
}


for (filas in 1:nrow(m)) {
  for (columnas in 1:ncol(m)){
    print(m[filas,columnas])
  }
}


dim(m)



####  DATAFRAMES ####

# EJERCICIO 8: Partiendo de un dataframe de ejemplo incluído en R (mtcars), realiza lo siguiente:

# 1.Almacena el dataframe en otro con nombre midf.
midf <- data.frame(mtcars)

# 2.Muestra por consola las primeras y las últimas filas del dataframe con las funciones head() y tail()
head(midf)
tail(midf)

# 3.Añade una columna al dataframe con los modelos de los coches, cuyo valor está en los nombres de cada fila. 
# Hazlo mediante midf$modelo <- …
midf$Modelo <- rownames(midf)

# 4.Crea otro dataframe de nombre df que contenga las filas 1 a 6 y las tres últimas columnas. 
# Para el cálculo de columnas utiliza ncol()
ncol(midf)
df <- midf[1:6,10:12]

# 5.Crea un vector con 6 colores como se muestra en la imagen y añádelo como una nueva columna al dataframe.
df$Color <- c("Rojo","Verde","Azul","Amarillo","Rojo","Negro")

# 6.Almacena en otro dataframe df2 las filas cuya columna gear sea igual a 4.
df2 <- midf[midf$gear==4,]

# 7.Almacena en un vector modelos solo los modelos de coche que tienen color Rojo o Verde.
modelos <- df[df$color=="Rojo"|df$color=="Verde","Modelo"]
modelos

# 8.Finalmente convierte el vector modelos en un dataframe.
df3 <- data.frame(modelos)


# EJERCICIO 9: Iris es un dataframe que almacena las medidas en centímetros de las variables longitud y 
# ancho del sépalo y longitud y ancho del pétalo, respectivamente, para 50 flores de cada una de las 3 especies 
# de iris. Las especies son Iris setosa , versicolor y virginica.
# 1.Partiendo del dataframe iris que incluye R, crea un dataframe para trabajar con él.
flores <- data.frame(iris)

# 2. En df.sub almacena un subcojunto del dataframe original con las siguientes características:
# Que el ancho del sépalo esté entre 3,1 y 3,2.
# La especie tendrá que ser setosa o versicolor.
# Solo se quieren las tres últimas columnas.
ncol(flores)
dfSub <- subset(flores, 
                (flores$Sepal.Width>=3.1 & Sepal.Width<=3.2) & 
                (Species=="setosa" | Species=="versicolor"),
                select=c(3:5))

# 3.Finalmente ordena el dataframe por el campo Species en orden inverso.
# Almacena el resultado en el dataframe df3.
df3 <- dfSub[order(dfSub$Species,decreasing=TRUE),]


# EJERCICIO 10: Cargar archivos CSV desde su URL y descargándolo en el ordenador.
install.packages("data.table")
library(data.table)

# Desde la URL
QualityAirNY <- fread("https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/datasets/airquality.csv")

#Desde mi directorio
Quality2 <- read.csv("airquality.csv",header=TRUE,sep=",", quote="\"",dec=".",comment.char = "")

#Quitamos NAs
na.omit(Quality2)


# EJERCICIO 11: Partiendo del dataframe volcano (Information Topográfica de los conos volcánicos en 
# Auckland) realiza un gráfico de barras y otro de los puntos.
barplot(height=volcano, col="pink")
plot(data=volcano)

head(volcano)
ncol(volcano)
colnames(volcano)
names(volcano)


# EJERCICIO 12: Elige un dataset y utilízalo para crear un histograma con la 
# función hist()

hist(chickwts$weight, labels = TRUE,ylim=c(0,20))




