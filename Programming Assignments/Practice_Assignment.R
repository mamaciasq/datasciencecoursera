## Descargando el archivo de la web y descomprimiéndolo en el working directory
dataset_url <- "http://s3.amazonaws.com/practice_assignment/diet_data.zip"
download.file(dataset_url, "diet_data.zip")
unzip("diet_data.zip", exdir = "diet_data")

## Obteniendo una lista de los archivos de la carpeta 
list.files("diet_data")

## Mirando qué hay dentro de uno de los archivos
andy <- read.csv("diet_data/Andy.csv")
head(andy)

## Cuántas filas hay mirando la longitud de la columna "Day"
length(andy$Day)

## Revisando las dimensiones del data.frame
dim(andy)
str(andy)
summary(andy)
names(andy)

## Peso inicial de Andy
andy[1, "Weight"]

## Peso final de Andy
andy[30, "Weight"]

## También se podría una columna 'Weight' donde la columna 'Day' sea igual a 30.
andy[which(andy$Day == 30), "Weight"]
andy[which(andy[,"Day"] == 30), "Weight"]

## O utilizar la función subset
subset(andy$Weight, andy$Day==30)

## Asignando pesos inciales y finales de Andy
andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]

## Cuánto peso ha perdido
andy_loss <- andy_start - andy_end; andy_loss

## Analizando la función list.files()
files <- list.files("diet_data"); files

## Sabiendo que 'files' es una lista de los contenidos de 'diet_data' en orden 
## alfabético, puede llamarse a un archivo específico mediante un subconjunto:
files[1]
files[2]
files[3:5]

## Revisando el contenido de John.csv
head(read.csv(files[3]))

## Arreglando el error con argumento 'full.names'
files_full <- list.files("diet_data", full.names=TRUE); files_full

## Revisando el contenido de John.csv
head(read.csv(files_full[3]))
tail(read.csv(files_full[3]))

## Haremos un gran data.frame donde se junten todos los datos de todos los archivos
## Comencemos con un rbind (primer argumento: data.frame existente, segundo
## argumento: lo que usted quiere añadir)
andy_david <- rbind(andy, read.csv(files_full[2]))

## Revisemos
head(andy_david)
tail(andy_david)

## Creemos un subconjunto del data frame que muestre únicamente el día 25 de
## Andy y David
day_25 <- andy_david[which(andy_david$Day == 25), ]; day_25

## Añadiremos usando un bucle 
for (i in 1:5) {
  dat <- rbind(dat, read.csv(files_full[i]))
}

## Creemos primero un data frame vacío llamado 'dat' antes del bucle
dat <- data.frame()
for (i in 1:5) {
  dat <- rbind(dat, read.csv(files_full[i]))
}
str(dat)

## Definiendo el 'dat' dentro del bucle lo que hace que se reescriba el 'dat2'
for (i in 1:5) {
  dat2 <- data.frame()
  dat2 <- rbind(dat2, read.csv(files_full[i]))
}
str(dat2)
head(dat2)

## Tomando la mediana de la variable 'Weight'
median(dat$Weight)

## Tomando la mediana de la variable 'Weight' obviando los 'NA'
median(dat$Weight, na.rm=TRUE)

## Mediana del peso del día 30 tomando la mediana de un subconjunto de datos donde 
## el Day=30
dat_30 <- dat[which(dat[, "Day"] == 30),]
dat_30
median(dat_30$Weight)

## Creando la función
weightmedian <- function(directory, day)  {
  files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
  dat <- data.frame()                             #creates an empty data frame
  for (i in 1:5) {                                
    #loops through the files, rbinding them together 
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
  median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
  #while stripping out the NAs
}

## Probando la función
weightmedian(directory = "diet_data", day = 20)
weightmedian("diet_data", 4)
weightmedian("diet_data", 17)

## Refinando el código
## Lo primero es crear una lista vacía que tenga la extensión de la salida deseada
## En este caso nuestro objeto de entrada será files_full y nuestra lista vacía
## será tmp
summary(files_full)
tmp <- vector(mode = "list", length = length(files_full))
summary(tmp)

## Leer archivos y soltarlos en el tmp
for (i in seq_along(files_full)) {
  tmp[[i]] <- read.csv(files_full[[i]])
}
str(tmp)

## Comparándola con lapply
str(lapply(files_full, read.csv))

## Manipulando los datos yendo de una lista a un data frame
str(tmp[[1]])
head(tmp[[1]][,"Day"])

## Combinando tmp en un sólo data frame 
output <- do.call(rbind, tmp)
str(output)