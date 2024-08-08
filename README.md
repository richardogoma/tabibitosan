# Tabibitosan Method - SQL
Using Tabibitosan Method for Sequence Grouping in SQL

## Problem
Given a dataset with record of when consecutive events occur, in this case, power off and power on of a feeders. 
How do we determine the duration of an outage?

## Data sample
| FEEDER_11 | Power_Off                      | Power_ON                       |
|-----------|--------------------------------|--------------------------------|
| 8 MILES   | NULL                           | 2023-02-21 00:00:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 00:30:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 01:00:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 01:30:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 02:00:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 02:30:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 03:00:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 03:30:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 04:00:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 04:30:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 05:00:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 05:30:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 06:00:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 06:30:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 07:00:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 07:30:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 08:00:00.0000000    |
| 8 MILES   | NULL                           | 2023-02-21 08:30:00.0000000    |
| 8 MILES   | 2023-02-21 09:00:00.0000000    | NULL                           |
| 8 MILES   | 2023-02-21 09:30:00.0000000    | NULL                           |
| 8 MILES   | 2023-02-21 10:00:00.0000000    | NULL                           |
| 8 MILES   | 2023-02-21 10:30:00.0000000    | NULL                           |
| 8 MILES   | 2023-02-21 11:00:00.0000000    | NULL                           |

From the sample, how do we calculate the number of minutes from 9:00 to 11:30 when an outage occured on the feeder? How do we identify and group consecutive rows? That's a tabibitosan challenge. 

## Result sample
| feeder   | start_time                      | end_time                        | outage_duration_minutes |
|----------|---------------------------------|---------------------------------|-------------------------|
| 8 MILES  | 2023-02-21 09:00:00.0000000     | 2023-02-21 11:00:00.0000000     | 120                     |
| 8 MILES  | 2023-02-23 12:00:00.0000000     | 2023-02-23 12:30:00.0000000     | 30                      |
| 8 MILES  | 2023-02-24 08:30:00.0000000     | 2023-02-24 09:00:00.0000000     | 30                      |
