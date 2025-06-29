Let’s fix this once and for all with a downloadable README.md file link and the exact raw content so you can grab it directly—no more copy-paste confusion.

Download the raw README.md here:

https://raw.githubusercontent.com/Kieranmcm07/WinCleaner/main/README.md

If that URL isn’t updated yet, here’s how to get it working:

In your repo’s main branch, overwrite README.md with the following content.

Commit & push.

Then click the Raw button on GitHub’s README page to download it.

<!-- assets/banner.png should be 640×200px -->
![WinCleaner Banner](assets/banner.png)

# WinCleaner

[![Release](https://img.shields.io/github/v/release/Kieranmcm07/WinCleaner?style=flat-square)](https://github.com/Kieranmcm07/WinCleaner/releases)
[![License: MIT](https://img.shields.io/github/license/Kieranmcm07/WinCleaner?style=flat-square)](https://github.com/Kieranmcm07/WinCleaner/blob/main/LICENSE)
[![CI](https://img.shields.io/github/actions/workflow/status/Kieranmcm07/WinCleaner/ci.yml?style=flat-square)](https://github.com/Kieranmcm07/WinCleaner/actions)

WinCleaner is a free, open-source Windows cleanup and maintenance tool by Nokky07 (Kieran). It automates removal of temp files, driver caches, browser data, suspicious tasks, and more via a colorful, menu-driven batch interface.

---

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Flags & Profiles](#flags--profiles)
- [Configuration](#configuration)
- [Screenshots](#screenshots)
- [Changelog](#changelog)
- [Contributing](#contributing)
- [License](#license)

---

## Features <a name="features"></a>

- Clean user & system temp folders (`%TEMP%`, `C:\Windows\Temp`)
- Purge Windows Prefetch cache
- Remove AMD, NVIDIA & Intel driver caches (with optional backup)
- Verify system files (`sfc /scannow`) & repair image (`DISM`)
- Clear browser caches (Chrome, Firefox, Edge)
- List non-Microsoft scheduled tasks for review
- Empty Recycle Bin (with confirmation)
- Colorful ASCII art, prompts & progress indicators
- Detailed logging to `%APPDATA%\WinCleaner\WinCleaner.log`
- Full-admin (UAC) launcher & elevation handling

*Planned for v1.x:* Windows Update cleanup, Event Log rotation, secure file shredder, duplicate-file finder, scheduler-based profiles.

---

## Installation <a name="installation"></a>

1. Clone or download the repo:  
   ```bash
   git clone https://github.com/Kieranmcm07/WinCleaner.git

(Optional) Install via Chocolatey (coming soon):

choco install wincleaner

Run as administrator:

Right-click WinCleaner.bat → Run as administrator

The launcher handles UAC and starts the elevated script.

Usage <a name="usage"></a>

Interactive Mode

WinCleaner.bat

Select tasks from the menu.

Command-Line Flags

Flag

Description

/all

Run all cleanup modules

/module:<n>

Run module number n only

/silent

Auto-confirm every prompt

/dryrun

Preview actions; don’t delete anything

/verbose

Show detailed logging in console

/update

Check GitHub for a newer release

/help

Display this help message

Example:

WinCleaner.bat /all /silent /verbose

Flags & Profiles <a name="flags--profiles"></a>

You can create named profiles and schedule them in Task Scheduler:

schtasks /Create /TN "WinCleaner Monthly" /TR "\"%~f0\" /all /silent\"" /SC MONTHLY /ST 03:00

Configuration <a name="configuration"></a>

(Coming soon in v1.x) Support for a wincleaner.json or settings.ini:

{
  "dryrun": false,
  "modules": [1,2,3,7],
  "excludePaths": ["C:\\Users\\Alice\\Downloads"]
}

Screenshots <a name="screenshots"></a>

Main Menu

Cleaning Temp Folders

Dry-Run Mode







Changelog <a name="changelog"></a>

See CHANGELOG.md or Releases for version history.

Contributing <a name="contributing"></a>

Fork the repo

Create a feature branch:

git checkout -b feature/MyFeature

Test with dry-run:

WinCleaner_Elevated.bat /dryrun /all

Submit a pull request.

Please read CODE_OF_CONDUCT.md before contributing.

License <a name="license"></a>

This project is licensed under the MIT License. See LICENSE for details.

Created with ♥ by @Nokky07 — 2025


After pushing, use this raw link to download directly:  
https://raw.githubusercontent.com/Kieranmcm07/WinCleaner/main/README.md