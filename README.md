
# Linux Server Monitoring Automation

## Overview

This project provides automated disk and memory monitoring for Linux servers using Bash and cron. It checks resource utilisation against configurable thresholds and records timestamped results in a local log file.

The aim is to provide a lightweight way to review server resource usage and identify potential capacity issues without requiring a dedicated monitoring platform.

## Features

- Disk utilisation monitoring for the root filesystem
- Memory usage monitoring
- Configurable warning thresholds
- Timestamped logging of monitoring results
- Scheduled execution every five minutes using cron
- Warning messages when resource usage reaches configured limits

## Technology Stack

- Linux (Ubuntu)
- Bash
- Cron
- Git

## Configuration

The monitoring script uses the following warning thresholds:

| Resource | Threshold |
|---|---|
| Disk utilisation | 80% |
| Memory utilisation | 85% |

Thresholds can be adjusted in `disk-monitor.sh` to suit the monitored environment.

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

The `logs/` directory is generated locally and excluded from Git version control.

## Usage

Run the monitoring script:

```bash
./disk-monitor.sh
```

Check the script for syntax errors:

```bash
bash -n disk-monitor.sh
```

View recent monitoring results:

```bash
tail -n 10 logs/monitor.log
```

## Scheduling

The monitoring script is configured to run every five minutes using cron.

The repository includes `crontab.example` as a reference for configuring scheduled execution.

To view the active cron configuration:

```bash
crontab -l
```

The script path must be adjusted to match the installation directory on the target Linux server.

## Design Decisions

**Bash:** Uses standard Linux utilities for resource monitoring without requiring an additional application runtime.

**Cron:** Provides straightforward scheduling for recurring monitoring tasks.

**Threshold-based checks:** Identifies resource utilisation that reaches configured warning levels.

**Local logging:** Maintains timestamped monitoring records for operational review and troubleshooting.

## Validation

The following checks were completed on an Ubuntu Linux environment:

- Bash syntax validation
- Manual script execution
- Disk warning threshold testing
- Memory warning threshold testing
- Verification of timestamped log entries
- Verification of scheduled execution through cron
- Restoration of normal thresholds following testing

## Limitations

This implementation provides basic resource monitoring and local logging. It does not currently include remote notifications, centralised metric collection or historical dashboards.

Scheduled execution depends on the Linux system and cron service being operational.
