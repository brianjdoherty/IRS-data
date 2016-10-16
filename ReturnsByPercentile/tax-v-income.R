library(tidyverse)
# https://www.irs.gov/pub/irs-soi

incshare <- read_csv("09in05tr-adjgrossincshare.csv", skip = 1)
names(incshare) <- c("year", "total", "top01", "top1", "top5", "top10", "top25", "top50")
incshare2 <- subset(incshare, select = -total) # drop total column
incshare_tidy <- gather(incshare2, key="percentile", value = "income", +
                        top01, top1, top5, top10, top25, top50)
# ggplot(incshare_tidy) +
#   geom_line(aes(x=year, y=income, colour=percentile)) +
#   labs(x="Tax year", y = "Adj gross income share, %") + ylim(0,100)

taxshare <- read_csv("09in05tr-totalinctaxshare.csv", skip = 1)
names(taxshare) <- c("year", "total", "top01", "top1", "top5", "top10", "top25", "top50")
taxshare2 <- subset(taxshare, select = -total) # drop total column
taxshare_tidy <- gather(taxshare2, key="percentile", value = "taxpaid", +
                        top01, top1, top5, top10, top25, top50)
# ggplot(taxshare_tidy) +
#   geom_line(aes(x=year, y=taxpaid, colour=percentile)) +
#   labs(x="Tax year", y = "Total income tax share, %") + ylim(0,100)

ggplot(taxshare_tidy) +
  geom_line(aes(x=year, y=taxpaid, colour=percentile)) +
  geom_line(data = incshare_tidy, aes(x=year, y=income, colour=percentile), 
            show.legend = FALSE) + labs(x="Tax year", y="") + ylim(0,100)