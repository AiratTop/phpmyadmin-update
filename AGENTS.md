# AGENTS.md

## Purpose
Local server utility to update phpMyAdmin quickly with backup and basic post-install configuration.

## Repository Role
- Category: local utility project.
- Type: Bash maintenance script.
- Main entrypoint: `phpmyadmin-update.sh`.

## Update Flow
1. Validate root privileges (`sudo` / EUID check).
2. Download selected phpMyAdmin release archive.
3. Extract files.
4. Backup existing install directory (if exists).
5. Install new version into `/usr/share/phpmyadmin`.
6. Create `tmp` directory and `config.inc.php`.
7. Generate and set random `blowfish_secret`.

## Key Variables (in script)
- `VER`: target phpMyAdmin version.
- `FNAME`: archive folder name derived from `VER`.
- `PMADIR`: install path (default `/usr/share/phpmyadmin`).

## Dependencies
- Root access.
- System tools: `wget`, `unzip`, `sed`, `mv`, `cp`, `head`, `tr`.
- Internet access to `files.phpmyadmin.net`.

## AI Working Notes
- Preserve backup step (`$PMADIR.backup-<timestamp>`) before replacement.
- Keep explicit root check to avoid partial installs.
- If changing permissions strategy (`tmp`), keep phpMyAdmin upload/session behavior functional.
- Keep `blowfish_secret` generation and write step in `config.inc.php`.
