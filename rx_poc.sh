#!/bin/bash


#Assign city name as Casablanca
city=Casablanca

#Obtain the weather report for Casablanca
curl -s wttr.in/$city?T --output weather_report

file="./weather_report"

#To extract Current Temperature
obs_temp=$(cat $file |  grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city: $obs_temp"

# To extract the forecast tempearature for noon tomorrow
fc_temp=$(cat $file | grep -m 3 '°.' | tail -n 1 | grep -Eo -e '-?[[:digit:]]......' | head -n 2 | tail -n 1)

echo "The forecasted temperature for noon tomorrow for $city : $fc_temp C"

# Use command substitution to store the current day, month, and year in corresponding shell variables:
cur_year=$(TZ='Morocco/Casablanca' date +%Y)
cur_month=$(TZ='Morocco/Casablanca' date +%m)
cur_day=$(TZ='Morocco/Casablanca' date +%d)


# Log the extracted weather data
echo -e "$cur_year\t$cur_month\t$cur_day\t$obs_temp\t$fc_temp" >> rx_poc.log
