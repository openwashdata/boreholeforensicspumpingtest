# boreholeforensicspumpingtest: Borehole Forensics 4 - Pumping Test

This dataset contains borehole forensic pumping test data, capturing key
parameters related to groundwater extraction, borehole performance, and
water quality assessments. It includes information on the test
conditions, water levels, pumping rates, flow measurement methods, and
water quality indicators such as pH, turbidity, and electrical
conductivity.

## Usage

``` r
boreholeforensicspumpingtest
```

## Format

A tibble with 445 rows and 38 variables

- date_of_survey_or_test:

  Date on which the borehole pumping test was conducted.

- is_it_possible_to_complete_pumping_test:

  Indicates whether the pumping test was successfully completed.

- specify_why_not_possible_to_complete_pumping_test:

  Reason why the pumping test could not be completed, if applicable.

- water_point_committee_permission:

  Whether permission was granted by the water point committee to conduct
  the test.

- district_water_office_permission:

  Whether permission was granted by the district water office to conduct
  the test.

- type_of_test:

  The type of pumping test performed on the borehole.

- static_water_level_metres_below_reference_point_before_start_of_test:

  Water level below the reference point before the start of the test (in
  meters).

- water_level_reference_point:

  The reference point used to measure water level (e.g., top of casing,
  ground level).

- other_water_level_reference_point:

  Additional reference point used for measuring water level, if
  applicable.

- reference_level_above_or_below_ground_level_in_miters:

  Measurement of the reference level relative to ground level (in
  meters).

- pump_intake_depth_in_miters:

  Depth at which the pump intake is placed within the borehole (in
  meters).

- total_hole_depth_in_miters:

  Total depth of the borehole (in meters).

- was_a_water_level_logger_used:

  Indicates whether a water level logger was used to record
  measurements.

- was_a_flow_meter_used:

  Indicates whether a flow meter was used during the test.

- other_flow_meter_used:

  Whether an alternative flow meter was used during the test.

- bucket_size_in_litres:

  Capacity of the bucket used for manual flow measurements (in liters).

- index_1:

  A logical index variable for internal tracking.

- time_in_mins:

  Whether time was recorded in minutes during the test.

- water_level_in_mbrp:

  Whether the water level was measured in meters below reference point.

- flowmeter_total:

  Whether the total flowmeter reading was recorded.

- flow_rate_in_liters_per_second:

  Whether the flow rate was measured in liters per second.

- flow_rate_method:

  Whether the method used to measure flow rate was recorded.

- index_2:

  A second logical index variable for internal tracking.

- time_of_sample_in_min:

  Whether the sampling time was recorded in minutes.

- ec_in_ms_per_cm:

  Whether electrical conductivity (EC) in millisiemens per centimeter
  was recorded.

- tds_ppt:

  Whether total dissolved solids (TDS) in parts per thousand (ppt) were
  recorded.

- temperature_in_celcius:

  Whether water temperature in degrees Celsius was recorded.

- ph:

  Whether pH of the water was measured.

- turbidity_ntu:

  Whether turbidity in nephelometric turbidity units (NTU) was measured.

- Imhoff_cone_cubic_centimeter_per_liter:

  Whether sediment concentration was measured using an Imhoff cone.

- did_water_level_stabilise_while_pumping_at_0.25_liters_per_second:

  Whether the water level stabilized while pumping at 0.25 liters per
  second.

- established_dwl_at_0.25l_per_second_m:

  Depth to the water level (DWL) at 0.25 liters per second pumping rate
  (in meters).

- maximum_successful_pumping_rate_in_liters_per_second:

  Highest pumping rate successfully achieved during the test (in liters
  per second).

- dwl_at_maximum_pumping_rate:

  Depth to the water level at the maximum pumping rate (in meters).

- silt_ejected_during_test:

  Whether silt was observed being ejected from the borehole during the
  test.

- did_the_borehole_pass_a_pumping_test:

  Whether the borehole passed the pumping test based on performance
  criteria.

- specify_other_borehole_pass_a_pumping_test:

  Additional details on the borehole's performance in the pumping test.

- comments_on_pumping_test:

  Additional comments or observations about the pumping test.

## Details

The dataset also documents permissions granted for testing, equipment
used, and observations on borehole performance, such as whether the
water level stabilized during pumping and whether the borehole passed
the test.
