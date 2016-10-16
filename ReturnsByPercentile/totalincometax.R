library(tidyverse)
taxpaid <- read_csv("09in05tr-totalincometax.csv", skip = 1)
names(taxpaid) <- c("year", "total", "top01", "top1", "top5", "top10", "top25", "top50")
taxpaid2 <- subset(taxpaid, select = -total) # drop total column
#taxpaid_tidy <- gather(taxpaid, key="percentile", value = "taxpaid", 
#                       total, top01, top1, top5, top10, top25, top50)
taxpaid2_tidy <- gather(taxpaid, key="percentile", value = "taxpaid", 
                       top01, top1, top5, top10, top25, top50)
ggplot(taxpaid2_tidy) + 
  geom_line(aes(x=year, y=taxpaid, colour=percentile))