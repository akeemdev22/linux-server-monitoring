
# Linux Server Monitoring Automation

## Project Overview

A Linux server monitoring solution built using Bash scripting to monitor disk and memory utilisation, detect resource usage exceeding configured thresholds, and record monitoring results in timestamped log files.

The monitoring process is automated using cron, allowing resource checks to run every five minutes without manual intervention.

## Technologies Used

- Ubuntu Linux
- Bash scripting
- Cron
- Git
- GitHub

## Features

- Disk usage monitoring
- Memory usage monitoring
- Configurable warning thresholds
- Automated resource checks using cron
- Timestamped monitoring logs
- Warning messages when resource usage reaches configured limits
- Git version control

## Monitoring Thresholds

| Resource | Warning Threshold |
|---|---|
| Disk usage | 80% |
| Memory usage | 85% |

## Project Structure

```text
linux-server-monitoring/
├── disk-monitor.sh
├── crontab.example
├── .gitignore
├── README.md
└── logs/
    └── monitor.log
```

The `logs/` directory is excluded from Git version control using `.gitignore`.

## Running the Monitoring Script

Execute the monitoring script:

```bash
./disk-monitor.sh
```

Check the script for syntax errors:

```bash
bash -n disk-monitor.sh
```

## Automated Monitoring

The monitoring script is scheduled to run every five minutes using cron.

Example cron configuration:

```cron
*/5 * * * * /bin/bash /home/tydevopslab/linux-server-monitoring/disk-monitor.sh
```

The script path must be updated when deploying the project to a different server.

To edit scheduled cron jobs:

```bash
crontab -e
```

To verify the configured schedule:

```bash
crontab -l
```

## Monitoring Logs

Monitoring results are saved locally to:

```text
logs/monitor.log
```

View recent monitoring activity:

```bash
tail -n 10 logs/monitor.log
```

Each monitoring record includes a timestamp, resource type, usage percentage and monitoring status.

## Testing and Validation

The monitoring solution was tested through:

- Bash syntax validation
- Manual script execution
- Disk usage warning simulation
- Memory usage warning simulation
- Monitoring log verification
- Cron automation verification
- Restoring configured thresholds after testing

## Operational Considerations

The solution provides local resource monitoring and logging. It does not currently include external notifications or centralised monitoring services.

Scheduled monitoring requires the Linux system and cron service to be running.
