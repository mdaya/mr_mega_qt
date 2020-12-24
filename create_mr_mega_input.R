library(SeqArray)

args <- commandArgs(trailingOnly = TRUE)
out.file.name <- args[1]
files <- args[-1]
rdata.files <- files[grep("\\.RData$", files)]
gds.files <- files[grep("\\.gds$", files)]
rdata.files <- rdata.files[order(rdata.files)]
gds.files <- gds.files[order(gds.files)]

if (length(rdata.files) != length(gds.files)) {
  stop(".RData and .gds files of different length")
}

for (i in 1:length(rdata.files)) {
  rdata.file <- rdata.files[i]
  load(rdata.file)
  
  gds.file <- gds.files[i]
  gds <- seqOpen(gds.file)
  
  variant.ids <- seqGetData(gds, "variant.id")
  chromosome <- seqGetData(gds, "chromosome")
  position <- seqGetData(gds, "position")
  alleles <- gsub(",", ":", seqGetData(gds, "allele"))
  ref.alleles <- unlist(strsplit(alleles, split=":"))[seq(1,length(alleles)*2,2)]
  alt.alleles <- unlist(strsplit(alleles, split=":"))[seq(2,length(alleles)*2,2)]
  snp.ids <- paste(chromosome, position, alleles, sep=":")
  snp.frame <- data.frame(variant.id=variant.ids, 
                          ref.allele=ref.alleles,
                          alt.allele=alt.alleles,
                          snp.id=snp.ids)
  seqClose(gds)
 
  assoc <- merge(assoc, snp.frame)
  
  out.frame <- data.frame(
    MARKERNAME=assoc$snp.id,
    EA=assoc$alt.allele,
    NEA=assoc$ref.allele,
    BETA=assoc$Est,
    SE=assoc$Est.SE,
    EAF=assoc$freq,
    N=assoc$n.obs,
    CHROMOSOME=assoc$chr,
    POSITION=assoc$pos,
    P=assoc$Score.pval)
  
  if (i==1) {
    write.table(out.frame, out.file.name,  sep="\t", quote=F, row.names=F, col.names=T, append=F)
  } else {
    write.table(out.frame, out.file.name,  sep="\t", quote=F, row.names=F, col.names=F, append=T)
  }
}

