
# Carregar dades

library(SummarizedExperiment)
raw <- read.csv("human_cachexia.csv")


# Adaptació del dataset
meta <- raw[ , 1:2]       
predata <- raw[ ,c(1,3:65)]
data_matrix <- as.matrix(predata)
data <- t(data_matrix)
colnames(data) <- data[1, ]
data <- data[-1, ]


# Creació objecte SummarizedExperiment (SE) i anàlisi estructura

se <- SummarizedExperiment(assays = list(counts = data), colData = meta)
class(se)
dim(se)
head(assay(se), n=2)

colData(se)


# Seleccionar subconjunts de dades
  
  # a) Aquells pacients que tenen caquèxia

se[ ,se$Muscle.loss == "cachexic"]


  # b) Pacients control de l'estudi

se[ ,se$Muscle.loss == "control"]


