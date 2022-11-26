library(jsonlite)
library(httr)
library(tidyverse)
#0 = shl, 1 = smjhl
league <- 0

#i believe s60 is when the build scale changed
seasons <- c(62:67)

player_list <- list()
for (i in seasons) {
  player_stats <- GET("http://index.simulationhockey.com/api/v1/players/stats", query = list(season = i))
  player_stats <- fromJSON(rawToChar(player_stats$content))
  player_stats <- do.call(data.frame, player_stats)
  player_list[[i]] <- player_stats
}
combined_player_stats <- do.call(rbind, player_list)
