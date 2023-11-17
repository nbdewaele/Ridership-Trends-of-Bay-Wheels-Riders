# Analysis script


## Basic stats
# Calculate summary statistics for "duration" for "member" riders
member_summary <- clean_trips_202210_202309 %>%
  filter(member_casual == "member") %>%
  summarise(
    mean_duration = mean(duration),
    median_duration = median(duration),
    sd_duration = sd(duration)
  )

# Calculate summary statistics for "duration" for "casual" riders
casual_summary <- clean_trips_202210_202309 %>%
  filter(member_casual == "casual") %>%
  summarise(
    mean_duration = mean(duration),
    median_duration = median(duration),
    sd_duration = sd(duration)
  )

# Print the summary statistics for "member" and "casual" riders
print("Summary Statistics for Member Riders:")
print(member_summary)

print("Summary Statistics for Casual Riders:")
print(casual_summary)


## Looks at the top 5 routes member riders take
library(dplyr)

# Filter the dataset for "member" type
member_routes <- clean_trips_202210_202309 %>%
  filter(member_casual == "member")

# Group the data by routes and count the occurrences
top_routes_member <- member_routes %>%
  group_by(start_station_name, end_station_name) %>%
  summarize(route_count = n()) %>%
  arrange(desc(route_count)) %>%
  head(5)

# View the top 5 routes
top_routes_member


## Looks at the top 5 routes casual riders take
# Filter the dataset for "casual" type
casual_routes <- clean_trips_202210_202309 %>%
  filter(member_casual == "casual")

# Group the data by routes and count the occurrences
top_routes_casual <- casual_routes %>%
  group_by(start_station_name, end_station_name) %>%
  summarize(route_count = n()) %>%
  arrange(desc(route_count)) %>%
  head(5)

# View the top 5 routes for "casual" type
top_routes_casual


## Looks at the top 5 start_station_names member riders take
# Filter the dataset for "member" type
member_start_stations <- clean_trips_202210_202309 %>%
  filter(member_casual == "member")

# Group the data by start_station_name and count the occurrences
top_start_stations_member <- member_start_stations %>%
  group_by(start_station_name) %>%
  summarize(start_station_count = n()) %>%
  arrange(desc(start_station_count)) %>%
  head(5)

# View the top 5 start stations for "member" type
top_start_stations_member


## Looks at the top 5 start_station_names causal riders take
# Filter the dataset for "casual" type
casual_start_stations <- clean_trips_202210_202309 %>%
  filter(member_casual == "casual")

# Group the data by start_station_name and count the occurrences
top_start_stations_casual <- casual_start_stations %>%
  group_by(start_station_name) %>%
  summarize(start_station_count = n()) %>%
  arrange(desc(start_station_count)) %>%
  head(5)

# View the top 5 start stations for "casual" type
top_start_stations_casual
