

this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

knitr::spin("./01.Vectors.R")

knitr::spin("./ZZ_Modelo_Apresentação_R.R")