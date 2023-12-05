
file_path <- "/Users/felicitafe/Downloads/t47d.count.txt"
counts <- read.table(file_path, header = TRUE, na.strings = "")


# Calculate log2-transformed averages
counts$t0_repsAvg_log2 <- log2(rowMeans(select(counts, c("t4_t0_rep1", "t4_t0_rep2"))) + 1)
counts$d2_t20_repsAvg_log2 <- log2(rowMeans(select(counts, c("t4_2d_t20_rep1", "t4_2d_t20_rep2"))) + 1)

merged_df <- counts %>%
  left_join(essentiality_list, by = "Gene")

newdata <- merged_df %>%
  filter(!is.na(Essentality))


lower_limit <- 0
upper_limit <- 0

# Filter the data based on the range
filtered_data <- newdata %>%
  filter(t0_repsAvg_log2 != lower_limit, t0_repsAvg_log2 != upper_limit)

filtered_data2 <- newdata %>%
  filter(d2_t20_repsAvg_log2 != lower_limit, d2_t20_repsAvg_log2 != upper_limit)


ggplot(filtered_data2 %>%
         arrange(desc(Essentality)),
       aes(x = t0_repsAvg_log2, y = d2_t20_repsAvg_log2, color = Essentality, alpha = 0.5)) +
  scale_color_manual(values = c("firebrick3", "palegreen3", "dodgerblue3")) + 
  theme(legend.position = "right") +
  labs(x = "T0", y = "2D T=20") +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "black", alpha=0.5) +  # Add 45-degree line
  ggtitle("T47D") +
  ylim(-2, 16) +  # Set the y-axis range
  xlim(-2, 16) +
  geom_point()
