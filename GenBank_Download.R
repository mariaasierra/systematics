setwd("~/Desktop/GASTROPODA")
library(ape)
secuenciash3<-read.csv("listah3.csv", header = T)  #Read file with sequences,gens and name
secuenciasgenh3<- read.GenBank(secuenciash3$sequence) #read nucleotide sequences using accession numbers
nombres <-mat.or.vec(length(secuenciash3$name),1) #read sequences names from first column 
nombres <- paste(secuenciash3$name) 
names(secuenciasgenh3)<- nombres #join sequences names with nucleotide sequences
write.dna(secuenciasgenh3,"secuenciash3.fas", format = "fasta")  #read in fasta file
write.nexus.data(secuenciasgenh3,"secuenciash3.nex", format= "DNA")  #transform to NEXUS format
