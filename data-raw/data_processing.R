# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame

# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx", "stringi"))
library(usethis)
library(fs)
library(here)
library(readr)
library(dplyr)
library(ggplot2)
library(lubridate)
library(stringi)

# Read data --------------------------------------------------------------------
data_in <- readr::read_csv("data-raw/Borehole Forensics 4 - Pumping Test.csv",
                           locale = readr::locale(encoding = "UTF-8"))

# Function to check for non-UTF-8 characters -----------------------------------
check_utf8 <- function(df) {
  invalid_cols <- sapply(df, function(column) {
    if (!is.character(column)) return(FALSE) # Only check character columns
    any(sapply(column, function(x) {
      if (is.na(x)) return(FALSE) # Ignore NA values
      !identical(iconv(x, from = "UTF-8", to = "UTF-8"), x)
    }))
  })

  bad_cols <- names(df)[invalid_cols]

  if (length(bad_cols) > 0) {
    message("Non-UTF-8 characters detected in columns: ", paste(bad_cols, collapse = ", "))
  } else {
    message("No non-UTF-8 characters found.")
  }
}

# Check and Fix Encoding ------------------------------------------------------
check_utf8(data_in)

data_in[] <- lapply(data_in, function(x) {
  if (is.character(x)) {
    iconv(x, from = "latin1", to = "UTF-8", sub = "")  # Convert to UTF-8 and remove problematic characters
  } else {
    x
  }
})

# Re-check encoding after conversion
check_utf8(data_in)

# Assign data to a variable ---------------------------------------------------
boreholeforensicspumpingtest <- data_in

# Tidy data -------------------------------------------------------------------
boreholeforensicspumpingtest <- boreholeforensicspumpingtest |>
  mutate(date_of_test = lubridate::dmy(date_of_test)) |>  # Convert to Date class
  rename(
    pumping_test_possible = is_it_possible_to_complete_pumping_test,
    pumping_test_not_possible_reason = specify_why_not_possible_to_complete_pumping_test,
    static_water_level = static_water_level_metres_below_reference_point_before_start_of_test,
    reference_level = reference_level_above_or_below_ground_level_in_miters,
    pump_intake_depth = pump_intake_depth_in_miters,
    total_hole_depth = total_hole_depth_in_miters,
    water_level_stabilised = did_water_level_stabilise_while_pumping_at_0.25_liters_per_second,
    dwl_at_0.25lps = established_dwl_at_0.25l_per_second_m,
    max_pumping_rate = maximum_successful_pumping_rate_in_liters_per_second,
    dwl_at_max_rate = dwl_at_maximum_pumping_rate,
    borehole_passed = did_the_borehole_pass_a_pumping_test,
    other_borehole_pass_reason = specify_other_borehole_pass_a_pumping_test
  )

# Export Data ------------------------------------------------------------------
usethis::use_data(boreholeforensicspumpingtest, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))

readr::write_csv(boreholeforensicspumpingtest,
                 here::here("inst", "extdata", paste0("boreholeforensicspumpingtest", ".csv")))

openxlsx::write.xlsx(boreholeforensicspumpingtest,
                     here::here("inst", "extdata", paste0("boreholeforensicspumpingtest", ".xlsx")))

# Create the plot for Static Water Level by Year -------------------------------
boreholeforensicspumpingtest <- boreholeforensicspumpingtest |>
  mutate(year = year(date_of_test))  # Extract year from date_of_test

# Plot
ggplot(boreholeforensicspumpingtest, aes(x = year, y = static_water_level)) +
  geom_point() +
  theme_minimal() +
  labs(
    title = "Static Water Level by Year",
    x = "Year",
    y = "Static Water Level (m below reference point)"
  )
