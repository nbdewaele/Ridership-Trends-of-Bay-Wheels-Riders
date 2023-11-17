# Visualizations

# Total Count of Member and Casual Riders by Day of the Week
# Load necessary libraries
library(dplyr)
library(lubridate)
library(ggplot2)

# Group the data set by member_casual and day of the week and count the occurrences
count_by_day <- clean_trips_202210_202309 %>%
  mutate(day_of_week = wday(started_at, label = TRUE, week_start = 1)) %>%
  group_by(member_casual, day_of_week) %>%
  summarize(count = n())

# Create a bar chart
ggplot(count_by_day, aes(x = day_of_week, y = count, fill = member_casual)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Total Count of Member and Casual Riders by Day of the Week",
    x = "Day of the Week",
    y = "Total Count"
  ) +
  scale_fill_manual(values = c("member" = "#4E79A7", "casual" = "#F28E2B")) +
  theme_minimal() +
  theme(legend.position = "top")


# Average number of bikes checked out by day
library(dplyr)
library(ggplot2)

# Extract the hour from 'started_at' and 'ended_at' variables
clean_trips_202210_202309 <- clean_trips_202210_202309 %>%
  mutate(start_hour = hour(started_at), end_hour = hour(ended_at))

# Create a data set with one row per hour and rider type
hourly_data <- clean_trips_202210_202309 %>%
  select(start_hour, end_hour, member_casual) %>%
  pivot_longer(cols = c(start_hour, end_hour), names_to = "hour_type", values_to = "hour")

# Calculate the average number of bikes checked out for each hour
hourly_avg_count <- hourly_data %>%
  group_by(hour, hour_type, member_casual) %>%
  summarize(avg_bikes_checked_out = n() / 2)

# Create a line chart with angled x-axis
ggplot(hourly_avg_count, aes(x = hour, y = avg_bikes_checked_out, color = member_casual)) +
  geom_line(size = 1) +
  labs(
    title = "Total Number of Bikes Checked Out by Hour of the Day",  # Modified title
    x = "Hour of the Day",
    y = "Total Bikes Checked Out",  # Modified Y-axis title
    color = "Rider Type"
  ) +
  scale_x_continuous(breaks = 0:23, labels = function(x) ifelse(x %% 2 == 0, sprintf("%02d:00", x), "")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Total bikes checked out per month
# Define the order of months in your desired sequence
month_order <- c(
  "2022-October", "2022-November", "2022-December",
  "2023-January", "2023-February", "2023-March", "2023-April",
  "2023-May", "2023-June", "2023-July", "2023-August", "2023-September"
)

# Filter the dataset to include only the months in month_order
filtered_monthly_counts <- monthly_counts %>%
  filter(year_month %in% month_order)

# Convert the year_month variable to a factor with the specified order
filtered_monthly_counts$year_month <- factor(filtered_monthly_counts$year_month, levels = month_order)

# Create the line graph with ordered months on the x-axis
ggplot(filtered_monthly_counts, aes(x = year_month, y = total_bikes_checked_out, color = member_casual, group = member_casual)) +
  geom_line(size = 1.5) +
  scale_color_manual(values = c('member' = '#4E79A7', 'casual' = '#F28E2B')) +
  labs(
    title = "Total Bikes Checked Out per Month",
    x = "Month",
    y = "Total Bikes Checked Out"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)) +
  theme(legend.position = "top") +
  scale_y_continuous(labels = scales::comma)  # Show more labeled marks on the y-axis




