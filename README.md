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
