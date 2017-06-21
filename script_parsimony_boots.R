setwd("~/Desktop/GASTROPODA/ANEXOS/Secuencias")
library(ape)
#install.packages("phangorn")
library(phangorn)
x_phy<-read.phyDat("h3_28s_12s_16s_coi_concatenada.phy", format="phylip", type="DNA")
x<-phyDat(x_phy, type="DNA")
set.seed(0)
dm = dist.hamming(x)
tree = NJ(dm)
parsimony(tree, x)
optim.parsimony(tree,x,rearrangements = "SPR", method= "fitch")
treeRatchet <- pratchet(x, start=tree, rearrangements = "SPR", perturbation = "ratchet", maxit=1000, k=20)
BStrees <- bootstrap.phyDat(x, pratchet, bs = 100)  #produces a list of bootstrapped data sets.
treeMP <- plotBS(treeRatchet,BStrees, "phylogram",bs.col="red" ) #plotBS plots a phylogenetic tree with the with the bootstrap values assigned to the (internal) edges.
add.scale.bar()
write.tree(BStrees) #trees in newick format

#consenso mayoria
source(wconsensus)
consenso_tortugas <- wconsensus(tortugas, collapse= TRUE, cutvalue =0.65)
summary(consenso_tortugas)

