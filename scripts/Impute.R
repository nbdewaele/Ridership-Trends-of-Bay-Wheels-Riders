library(dplyr)

# Impute missing start station names
trips_202210_202309_precleaned <- trips_202210_202309_precleaned %>%
  group_by(start_station_id) %>%
  mutate(start_station_name = ifelse(start_station_id != "" & start_station_name == "", first(start_station_name[start_station_name != ""]), start_station_name)) %>%
  ungroup()

# Impute missing start station IDs
trips_202210_202309_precleaned <- trips_202210_202309_precleaned %>%
  group_by(start_station_name) %>%
  mutate(start_station_id = ifelse(start_station_name != "" & start_station_id == "", first(start_station_id[start_station_id != ""]), start_station_id)) %>%
  ungroup()

# Impute missing end station names
trips_202210_202309_precleaned <- trips_202210_202309_precleaned %>%
  group_by(end_station_id) %>%
  mutate(end_station_name = ifelse(end_station_id != "" & end_station_name == "", first(end_station_name[end_station_name != ""]), end_station_name)) %>%
  ungroup()

# Impute missing end station IDs
trips_202210_202309_precleaned <- trips_202210_202309_precleaned %>%
  group_by(end_station_name) %>%
  mutate(end_station_id = ifelse(end_station_name != "" & end_station_id == "", first(end_station_id[end_station_id != ""]), end_station_id)) %>%
  ungroup()