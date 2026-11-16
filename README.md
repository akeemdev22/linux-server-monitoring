
# Linux Server Monitoring Automation

## Overview

A Bash based monitoring script for checking disk and memory utilisation on Linux servers. The script compares resource usage against defined thresholds, reports the status of each check and writes timestamped results to a local log file.

Cron is used to run the monitoring script every five minutes, removing the need to execute checks manually.

## Features

- Monitors disk utilisation on the root filesystem
- Checks system memory usage
- Reports warnings when resource usage reaches configured thresholds
- Records monitoring results with timestamps
- Runs automatically every five minutes using cron
- Keeps generated log files outside Git version control

## Technologies

- Ubuntu Linux
- Bash
- Cron
- Git and GitHub

## Configuration

The monitoring script uses two warning thresholds:

- **Disk usage:** 80%
- **Memory usage:** 85%

These values can be changed in `disk-monitor.sh` depending on the requirements of the server being monitored.

## Project Files

- `disk-monitor.sh` — Main script responsible for checking disk and memory usage, evaluating thresholds and writing monitoring logs.
- `crontab.example` — Example cron configuration showing how to schedule the monitoring script.
- `.gitignore` — Prevents locally generated monitoring logs from being committed to Git.
- `README.md` — Project documentation.

Monitoring records are written locally to `logs/monitor.log`.

## Running the Script

Clone the repository and navigate into the project directory.

Give the monitoring script execute permission if required:

`chmod +x disk-monitor.sh`

Run the script manually:

`./disk-monitor.sh`

Check the script for Bash syntax errors:

`bash -n disk-monitor.sh`

View the latest monitoring records:

`tail -n 10 logs/monitor.log`

## Scheduling

The monitoring script is scheduled to execute every five minutes using cron.

The repository includes `crontab.example` as a reference for setting up the scheduled task.

To configure the cron job:

`crontab -e`

To verify the configured schedule:

`crontab -l`

The cron configuration must reference the correct script location on the target server.

## Implementation

The monitoring script uses standard Linux utilities to collect resource usage information.

Disk utilisation is retrieved using `df`, while memory usage is calculated using `free` and `awk`.

The collected values are compared against configured thresholds to determine whether the monitored resources are within acceptable limits.

Each execution records the monitoring results and timestamp in a local log file, allowing previous checks to be reviewed during troubleshooting.

Cron handles recurring execution without requiring the script to remain running continuously.

## Testing

The implementation was tested on an Ubuntu Linux virtual machine.

Validation included:

- Checking Bash syntax
- Running the script manually
- Testing disk usage warnings by temporarily lowering the threshold
- Testing memory usage warnings by temporarily lowering the threshold
- Confirming monitoring results were written to the log file
- Verifying that cron executed the script automatically
- Restoring the original thresholds after testing

## Limitations

The current implementation provides basic resource monitoring and local logging.

It does not send email notifications, collect metrics centrally or provide a monitoring dashboard.

Scheduled checks depend on the Linux server and cron service being operational.
