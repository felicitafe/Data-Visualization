# Scatter Plot Based on Cytoband


ggplot(ex, aes(x=pos, y=pval), geom_jitter()) + 
  geom_point(stat = "identity",  size=.1, aes(colour = factor(label))) + 
  xlab("Genomic Position") +
  ylab("Adjusted p-value") +
  ggtitle("ERα MCF7 Peaks") +
  theme(plot.title=element_text(hjust=0.5) ,
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  xlab("Genomic Position (chr1q)") +
  facet_grid(. ~ facet , scales = "free_x", space = "free_x", switch="both") +
  scale_color_manual(name="Binding",
                     labels=c("direct","indirect"),
                     values=c("orangered","dodgerblue2"))  

