# Weather Forecast vs. Actuals. Using Bash script + Cron job

Small proof-of-concept that logs Casablanca’s daily
temperature **forecast** and **actual** values.

## What it does
1. Creates/maintains `rx_poc.log` (tab-delimited)
2. `rx_poc.sh`  
   • downloads raw data from [wttr.in](https://wttr.in)  
   • parses today’s observed temp and tomorrow-noon forecast  
   • appends a row: `year  month  day  obs_temp  fc_temp`  
3. Adds a cron entry so the script runs every day at local noon

## Quick start
```bash
git clone https://github.com/Aly-Habib/Weather-Forecast-vs-Actuals-Bash-Cron.git
cd Weather-Forecast-vs-Actuals-Bash-Cron
chmod u+x rx_poc.sh          # make script executable
./rx_poc.sh                 # run once
cat rx_poc.log              # view log file
```

## Schedule with cron
Run the following command to open cron job file to edit
```bash
crontab -e
```
Then, add the following line and save the file.
```bash
0 12 * * * /path/to/rx_poc.sh   # daily at 12:00 (Casablanca)
```

File overview

| File	     | Purpose                               |
|:-----------|:--------------------------------------|
| rx_poc.sh	 | main Bash script / ETL pipeline       |
| rx_poc.log | growing weather history               |
| weather_report |	raw download (overwritten)       | 
| Sample output |(rx_poc.log) |

### rx_poc.log Sample data 

| year | month | day |	obs_temp |	fc_temp |
|:-----|:------|:----|:----------|:---------|
| 2024 | 05 | 8 | 26 |	28 |
| 2024 | 05 | 9 | 27 | 29 |

### Why this project?
Keeps the tooling minimal—perfect for learning:

- pure Bash + coreutils
- cron for orchestration
- simple tab file for storage

![screenshot](/sc 1.png)
