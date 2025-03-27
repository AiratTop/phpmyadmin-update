# airat-phpmyadmin-update
A script for quickly updating [phpMyAdmin](https://www.phpmyadmin.net/) on a server.

## Installation and Usage:
```bash
git clone https://github.com/AiratTop/airat-phpmyadmin-update

cd airat-phpmyadmin-update

sudo ./airat-phpmyadmin-update.sh
```

**Notes:**
- The script works with the `/usr/share/phpmyadmin` folder. If your `phpMyAdmin` is installed in a different directory, simply update the `PMADIR` variable.
- Before running the script, remember to update the phpMyAdmin version in the `VER` variable.
- The `blowfish_secret` key in the `config.inc.php` file is automatically generated and added by the script.
- A quick reference guide with explanations can be found [here](https://www.dmosk.ru/miniinstruktions.php?mini=phpmyadmin-update).

Feel free to suggest or add improvements if needed. 
