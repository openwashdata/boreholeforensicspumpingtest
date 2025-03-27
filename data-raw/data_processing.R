# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx"))
library(usethis)
library(fs)
library(here)
library(readr)

# Read data --------------------------------------------------------------------

data_in <- readr::read_csv("data-raw/Borehole Forensics 4 - Pumping Test.csv")

# Tidy data --------------------------------------------------------------------

boreholeforensicspumpingtest <- data_in |>
  # reformate to Date class
  mutate(date_of_test = lubridate::dmy(date_of_test)) |>
  # rename variables
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
