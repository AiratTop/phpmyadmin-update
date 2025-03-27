# airat-phpmyadmin-update

A script for quickly and safely updating [phpMyAdmin](https://www.phpmyadmin.net/) on a server. It automates the download, backup, installation, and configuration process.

## Features:
- Automatically downloads the specified version of phpMyAdmin.
- Creates a backup of the existing phpMyAdmin directory (if it exists).
- Installs the new version to `/usr/share/phpmyadmin`.
- Configures the `blowfish_secret` in the `config.inc.php` file with a randomly generated key.
- Sets proper permissions for the `tmp` folder.

## Installation and Usage:
```bash
git clone https://github.com/AiratTop/airat-phpmyadmin-update

cd airat-phpmyadmin-update

sudo ./airat-phpmyadmin-update.sh
```

## Notes:
- The script assumes phpMyAdmin is installed in `/usr/share/phpmyadmin`. If it is in a different directory, update the `PMADIR` variable in the script.
- Update the `VER` variable in the script to the desired phpMyAdmin version before running it.
- A backup of the current phpMyAdmin directory is automatically created with a timestamped name (e.g., `/usr/share/phpmyadmin.backup-<timestamp>`).
- The script ensures the `tmp` directory is writable by setting `chmod 777`.

Feel free to suggest or add improvements if needed.
