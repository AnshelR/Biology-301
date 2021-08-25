# Author: Ross, Date: Aug 23, 2021, Purpose: Analyze microarray data

# Install library limma and human reference genome

BiocManager::install("limma", dependencies=TRUE)
library limma library affy

phenoData <- read.AnnotatedDataFrame(system.file("extdata", "pdata.txt", package="arrays"))

celfiles <- system.file("extdata", package="arrays")

eset <- justRMA(phenoData=phenoData, celfile.path=celfiles)

combn <- factor(paste(pData(phenoData)[,1], pData(phenoData)[,2], sep = "_"))

design <- model.matrix(~combn)

fit <- lmFit(eset, design)

efit <- eBayes(fit)

topTable(efit, coef=2)
