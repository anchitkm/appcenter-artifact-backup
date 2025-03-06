# AppCenter Artifact Backup Script

## Overview

Microsoft AppCenter is shutting down by **March 2025**, and this script helps you back up all your artifacts (APKs, IPAs, etc.) from AppCenter to your local machine.

## Features

- Downloads all build artifacts from your AppCenter projects.
- Supports multiple apps and organizations.
- Saves files with appropriate names for easy identification.

## Prerequisites

- A Unix-based system (Linux/macOS) or Windows with Git Bash
- `curl` installed (usually pre-installed on Unix-based systems)

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/your-username/appcenter-artifact-backup.git
   cd appcenter-artifact-backup
   ```
2. Make the script executable:
   ```sh
   chmod +x backup_script.sh
   ```

## Usage

1. Open the script and update the following variables:
   ```sh
   ORG_NAME="YOUR_ORG_NAME"
   APP_NAME="YOUR_APP_NAME"
   API_TOKEN="YOUR_APPCENTER_API_TOKEN"
   ```
2. Run the script:
   ```sh
   ./backup_script.sh
   ```
3. Your artifacts will be downloaded to a local folder named after your app.

## Script Details

This script:
- Fetches all releases for a given AppCenter app.
- Extracts release IDs and corresponding version numbers.
- Retrieves download URLs and downloads the artifacts.
- Saves each build in a separate folder named after the version.

## Example Output Structure

```
/app_name/
  ├── build_1.0.0/
  │   ├── 1.0.0.apk
  ├── build_1.1.0/
  │   ├── 1.1.0.apk
```

## License

This project is licensed under the MIT License. Feel free to use and modify it as needed.

## Contributions

Contributions are welcome! Feel free to open issues or submit pull requests.

## Contact

For any queries, reach out via [GitHub Issues](https://github.com/your-username/appcenter-artifact-backup/issues).

