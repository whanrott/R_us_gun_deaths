library(ggplot2)

gd <- read.csv("all_us_firearm_deaths_male.csv", stringsAsFactors = F)
gd <- gd[is.na(gd$Year)==F,]
# gd <- gd[gd$Race == "Black" | gd$Race == "White", ]
gd$Population <- as.numeric(gd$Population)
gd$Crude.Rate <- as.numeric(gd$Crude.Rate)
print(
  ggplot(gd, aes(Year, Crude.Rate, colour = Age.Group)) + geom_line() + facet_wrap(facets = ~ Race) + xlab("Year") + ylab("Deaths per 100,000 population (in this group)") + ggtitle("All US Male Firearm Deaths by Age")
)
ggsave("gun_deaths.png")

gd_suicide <- read.csv("suicide_firearm_deaths_male.csv", stringsAsFactors = F)
gd_suicide <- gd_suicide[is.na(gd_suicide$Year)==F,]
# gd_suicide <- gd_suicide[gd_suicide$Race == "Black" | gd_suicide$Race == "White", ]
gd_suicide$Population <- as.numeric(gd_suicide$Population)
gd_suicide$Crude.Rate <- as.numeric(gd_suicide$Crude.Rate)

print(
  ggplot(gd_suicide, aes(Year, Crude.Rate, colour = Age.Group)) + geom_line() + facet_wrap(facets = ~ Race) + xlab("Year") + ylab("Deaths per 100,000 population (in this group)") + ggtitle("US Male Suicides using a Firearm by Age")
)

ggsave("suicide_deaths.png")
