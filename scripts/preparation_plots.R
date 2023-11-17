# Here is code for some of the plots I did.

## I made a violin plot to help me identify outliers also, but I did not cover that in the .Rmd file
### Load the ggplot2 library
library(ggplot2)

### Create a Violin Plot
ggplot(trips_202210_202309_precleaned, aes(x = "", y = duration)) +
  geom_violin(fill = "lightblue", color = "blue") +
  theme_minimal() +
  labs(title = "Violin Plot of Duration",
       y = "Duration (in Minutes)") +
  coord_flip()
