library(ggtree)
library(phylobase)
data = read.csv('retentiontimeMACCS.csv',header = FALSE)
dismat = dist(data[,-1])
tre = dismat %>% as.dist %>% hclust %>% as.phylo
names = as.character(data$V1)
tre$tip.label = names
time = read.csv('time.csv')
timedata = time$TrE.min.
d= data.frame(retention_time=timedata)
tr2 = phylo4d(tre,d)
ggtree(tr2,layout = 'circular') + geom_tiplab2(aes(color=retention_time))+ scale_color_continuous(low='red', high='green')+theme(legend.position="right")
