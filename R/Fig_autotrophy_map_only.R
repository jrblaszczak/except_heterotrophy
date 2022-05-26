# Annual autotrophy in streams
# May 26, 2022
# Joanna Blaszczak

## load more packages
lapply(c("plyr","dplyr","ggplot2","cowplot",
         "lubridate","tidyverse", "reshape2",
         "plotrix", "data.table","ggmap","maps","mapdata",
         "ggsn","wesanderson"), require, character.only=T)


# But file is small enough and has been added to "data_356rivers" folder
site_info <- read.table("data_356rivers/site_data.tsv",sep = "\t", header=T)
auto_1$site_name <- auto_1$SiteID
auto_1 <- merge(auto_1, site_info, by="site_name")

(fig3 <- ggmap(get_stamenmap(bbox=c(-125, 25, -66, 50), zoom = 5, 
                             maptype='toner'))+
    geom_point(data = auto_1, aes(x = lon, y = lat, 
                                  fill=event_dur, size=event_dur),
               shape=21)+
    theme(legend.position = "right")+
    labs(x="Longitude", y="Latitude")+
    scale_fill_gradient("Mean Autotrophic Event (days)",
                        low = "blue", high = "red",
                        breaks=c(1, 7, 14),
                        labels=c("1 day", "1 week", "2 weeks"))+
    scale_size_continuous("Mean Event Duration",
                          breaks = c(1,7,14),
                          labels=c("1 day", "1 week", "2 weeks")))



