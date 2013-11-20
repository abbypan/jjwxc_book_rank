d <- read.table('book_info.csv', sep=',', header=TRUE, 
                fileEncoding='UTF-8',blank.lines.skip=FALSE, 
                stringsAsFactors=FALSE, na.strings=0)
d[is.na(d)] <- 0

data <- d[,c('rank', 'collect','comment', 'max_chapter_click')]
pca <- prcomp(data, retx=T, center=T, scale=T)
pca$rotation

v <- summary(pca)
weight <- v$importance[2,]
weight[3:4] <- 0
m_weight <- matrix(weight, nrow=4,ncol=1, byrow=TRUE)

pca_rank <- pca$x %*% m_weight 
names(pca_rank) <- 'pca_rank'
w <- cbind(d, pca_rank)
w <- w[order(-w$pca_rank), ]

out <- paste(seq(1, length(w$id)), 
             w$id, sprintf('%.8f', w$pca_rank), sep=',')
write.table(out, 'book_rank_pca.csv', sep=',', 
            col.names=FALSE, 
            row.names=FALSE,quote=FALSE)
