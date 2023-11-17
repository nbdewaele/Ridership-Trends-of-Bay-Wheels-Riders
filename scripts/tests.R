# Tests

# Check for duplicate records based on the ride_id column
duplicate_records <- trips_202210_202309_precleaned[duplicated(trips_202210_202309_precleaned$ride_id), ]
# View the duplicate records
View(duplicate_records)


# Count null values
cat("Number of null started_at values:", null_started_at_count, "\n")
cat("Number of null ended_at values:", null_ended_at_count, "\n")
cat("Number of null start_station_name values:", null_started_name_count, "\n")
cat("Number of null end_station_name values:", null_ended_name_count, "\n")
cat("Number of null start_station_id values:", null_started_id_count, "\n")
cat("Number of null end_station_id values:", null_end_id_count, "\n")
cat("Number of null end_station_id values:", null_end_id_count, "\n")
cat("Number of null start_lat values:", null_start_lat_count, "\n")
cat("Number of null start_lng values:", null_start_lng_count, "\n")
cat("Number of null end_lat values:", null_end_lat_count, "\n")
cat("Number of null end_lng values:", null_end_lng_count, "\n")
cat("Number of null member_casual values:", null_member_casual_count, "\n")
cat("Number of null rideable_type values:", null_rideable_type_count, "\n")

# Look for variables that have empty strings
# Load the necessary libraries
library(dplyr)

# Create a function to count empty strings
count_empty_strings <- function(variable) {
  sum(variable == "")
}

# Specify the dataset
dataset <- trips_202210_202309_precleaned

# List of variable names
variables <- c("ride_id", "rideable_type", "started_at", "ended_at", "start_station_name",
               "start_station_id", "end_station_name", "end_station_id", "start_lat", "start_lng",
               "end_lat", "end_lng", "member_casual")

# Use sapply to count empty strings for each variable
empty_string_counts <- sapply(variables, function(var) {
  count_empty_strings(dataset[[var]])
})

# Create a data frame to display the counts
empty_string_counts_df <- data.frame(Variable = variables, Count = empty_string_counts)

# Print the results
print(empty_string_counts_df)


# test to make sure started_at and ended_at have been converted to date-time
str(trips_202210_202309_precleaned)


# Load the dplyr library if not already loaded
library(dplyr)

# Check for duration values less than or equal to zero
duration_zero_or_less <- your_dataset %>% filter(duration <= 0)

# View the resulting dataset
head(duration_zero_or_less)


# Check highest and lowest durations
# Find the highest duration
highest_duration <- max(trips_202210_202309_precleaned$duration)

# Find the lowest duration
lowest_duration <- min(trips_202210_202309_precleaned$duration)

cat("Highest Duration:", highest_duration, "\n")
cat("Lowest Duration:", lowest_duration, "\n")


# Calculate the mean, median, and standard deviation of the 'duration' column in your dataset
mean_duration <- mean(trips_202210_202309_precleaned$duration)
median_duration <- median(trips_202210_202309_precleaned$duration)
std_deviation <- sd(trips_202210_202309_precleaned$duration)

# Print the results
cat("Mean Duration:", mean_duration, "\n")
cat("Median Duration:", median_duration, "\n")
cat("Standard Deviation:", std_deviation, "\n")