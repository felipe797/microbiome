remove_rare <- function(table, cutoff, min_reads) {
    filtered = table[,colSums(table) > min_reads]
    colkept <- c()
    cutoff <- ceiling(cutoff * nrow(filtered))  
    for(i in 1:ncol(filtered)){
        nonzero_col <- length(which(filtered[,i]  > 0 )) 
        if(nonzero_col > cutoff){
            colkept <- c(colkept, i)
        }
    }
    return(filtered[drop=F, , colkept])
}
