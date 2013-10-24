library(GenomicRanges)

#Objects/tasks in computational biology = integer intervals and their manipulation

library(IRanges)
R1 <- IRanges(start = c(1,3,5), end = c(3,5,7))
R1
R2 <- IRanges(start = c(1,3,5), width = 3)
all.equal(R1, R2)

#Accessors: start(), end(), width()
start(R1)
end(R1)
width(R2) <- 1
R2

names(R1) <- paste("myRange", 1:3, sep = "")
R1
dim(R1)
length(R1)

#reduce
reduce(R1)

#shift(), narrow(), flank(), shift(), narrow(), restrict()
#union(), intersect(), setdiff(), gaps()

#finding overlaps
R1 <- IRanges(start = c(1,4,8), end = c(3,7,10))
R2 <- IRanges(start = c(3,4), width = 3)
olaps <- findOverlaps(R1, R2) #query,subject
olaps
#queryHits(), subjectHits()
as.matrix(olaps)

#counting overlaps
countOverlaps(R1, R2)

########
#GRanges
########

GR <- GRanges(seqnames = "chr1", 
              ranges = R1, 
              strand = c("+", "-", "+")) #+,-,*
GR

strand(GR)
seqnames(GR)
ranges(GR)

seqlengths(GR) <- c("chr1" = 10)

values(GR) <- data.frame(score = c(0.1, 0.5, 0.3))
elementMetadata(GR)


#Note
GR1 <- GRanges(seqnames = "chr2L", 
              ranges = R1, 
              strand = c("+", "-", "+")) #+,-,*

GR2 <- GRanges(seqnames = "2L", 
               ranges = R1, 
               strand = c("+", "-", "+")) #+,-,*


