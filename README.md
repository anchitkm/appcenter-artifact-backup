# appcenter-artifact-backup

# AppCenter Artifact Backup Script

## Overview

Microsoft AppCenter is shutting down by **March 2025**, and this script helps you back up all your artifacts (APKs, IPAs, etc.) from AppCenter to your local machine.

## Features

- Downloads all build artifacts from your AppCenter projects.
- Supports multiple apps and organizations.
- Saves files with appropriate names for easy identification.

## Prerequisites

- AppCenter CLI installed ([Installation Guide](https://learn.microsoft.com/en-us/appcenter/cli/))
- An active AppCenter API token ([Generate Token](https://appcenter.ms/settings))

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/anchitkm/appcenter-artifact-backup.git
   cd appcenter-artifact-backup
   ```
2. Install required dependencies:
   ```sh
   pip install -r requirements.txt
   ```

## Usage

1. Authenticate with AppCenter:
   ```sh
   appcenter login
   ```
2. Run the script with your API token:
   ```sh
   python backup_script.py --api-token YOUR_APPCENTER_API_TOKEN
   ```
3. Your artifacts will be downloaded to a local folder named `appcenter_backup/`.

## Configuration

You can modify `config.json` to specify:

- Organization name
- App names
- Destination folder

## License

This project is licensed under the MIT License. Feel free to use and modify it as needed.

## Contributions

Contributions are welcome! Feel free to open issues or submit pull requests.

## Contact

For any queries, reach out via [GitHub Issues](https://github.com/anchitkm/appcenter-artifact-backup/issues).

