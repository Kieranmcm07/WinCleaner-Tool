<!-- assets/banner.png should be 640×200px -->

WinCleaner

WinCleaner is a free, open-source Windows cleanup and maintenance tool by Nokky07 (Kieran). It automates the removal of temp files, driver caches, browser data, suspicious tasks and more—all via a colorful, menu-driven batch interface.

📑 Table of Contents
🚀 Features

🛠️ Installation

⚙️ Usage

🏷 Flags & Profiles

🔧 Configuration

📸 Screenshots

📜 Changelog

🤝 Contributing

📄 License

🚀 Features
✅ Clean user & system temp folders (%TEMP%, C:\Windows\Temp)

✅ Purge Windows Prefetch cache

✅ Remove AMD, NVIDIA & Intel driver caches (with optional backup)

✅ Verify system files (sfc /scannow) & repair image (DISM)

✅ Clear browser caches (Chrome, Firefox, Edge)

✅ List non-Microsoft scheduled tasks for review

✅ Empty Recycle Bin (with confirmation)

✅ Colorful ASCII art, prompts & progress indicators

✅ Detailed logging to %APPDATA%\WinCleaner\WinCleaner.log

✅ Full-admin (UAC) launcher & elevation handling

Upcoming in v1.x: Windows Update Cleanup, Event Log rotation, secure file shredder, duplicate-file finder, scheduler-based profiles.

🛠️ Installation
Clone or download this repository:

bash
git clone https://github.com/Kieranmcm07/WinCleaner.git
(Optional) Install via Chocolatey (coming soon):

powershell
choco install wincleaner
Run

Right-click WinCleaner.bat → Run as administrator

The launcher handles UAC and kicks off the elevated script.

⚙️ Usage
Interactive Mode
powershell
WinCleaner.bat
Follow the on-screen menu to pick individual cleanup tasks.

CLI Flags
Flag	Description
/all	Run all cleanup modules sequentially
/module:<n>	Execute a single menu option (e.g. 3)
/silent	Auto-confirm every prompt (no user input)
/dryrun	Show what would be deleted, don’t delete
/verbose	Display detailed logs in the console
/update	Check for a newer release on GitHub
/help	Show usage information
Example:

powershell
WinCleaner.bat /all /silent /verbose
🏷 Flags & Profiles
Create custom “profiles” (e.g. Gaming, Office) and schedule them via Task Scheduler:

powershell
schtasks /Create /TN "WinCleaner Monthly" /TR "\"%~f0\" /all /silent\"" /SC MONTHLY /ST 03:00
Profiles allow you to bundle specific modules under one named set.

🔧 Configuration
> Coming soon in v1.x: support for an optional wincleaner.json or settings.ini with per-user defaults:

json
{
  "dryrun": false,
  "modules": [1,2,3,7],
  "excludePaths": ["C:\\Users\\Alice\\Downloads"]
}
📸 Screenshots
<!-- put your screenshots in assets/screenshots/ -->

Main Menu	Cleaning Temp Folders	Dry-Run Mode
📜 Changelog
All notable changes to WinCleaner are documented in CHANGELOG.md or under Releases.

🤝 Contributing
Fork the repo

Create a feature branch: git checkout -b feature/YourFeature

Lint & test your changes:

powershell
WinCleaner_Elevated.bat /dryrun /all
Submit a pull request—ensure all new modules live under /modules/*.bat and follow the existing naming/style conventions.

Please read our Code of Conduct before contributing.

📄 License
This project is licensed under the MIT License. See the LICENSE file for details.

Created with ♥ by @Nokky07 — 2025