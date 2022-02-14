# Scatter Plot Based on Cytoband
# y axis is genomic coordinates, divided into cytoband ranges


ggplot(ex, aes(x=pos, y=pval), geom_jitter()) + 
  geom_point(stat = "identity",  size=.1, aes(colour = factor(label))) + 
  xlab("cytoband") +
  ylab("p-value") +
  ggtitle("ERα MCF7 Peaks") +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  xlab("Genomic Position (chr1q)") +
  facet_grid(. ~ facet , scales = "free_x", space = "free_x", switch="both") +
  scale_color_manual(name="label",
                     labels=c("x","y"),
                     values=c("orangered","dodgerblue2"))  


