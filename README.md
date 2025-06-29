# WinCleaner

**WinCleaner** is a free, open-source Windows cleanup and maintenance tool by Nokky07 (Kieran).  
It helps you quickly clean temp files, driver caches, browser caches, suspicious scheduled tasks, and more — all with a stylish, colorized batch interface.

---

## 🚀 Features

- Clean user and system temp folders
- Clean AMD/NVIDIA/INTEL driver caches (with backup)
- Verify system files (`sfc /scannow`)
- Clear Windows Prefetch cache
- Repair system image (`DISM`)
- Clean Windows Temp folder
- Clean browser caches (Chrome, Firefox, Edge)
- List non-Microsoft scheduled tasks (for manual review)
- Empty the Recycle Bin (with confirmation)
- Colorful ASCII art and clear prompts
- Logging of all actions to `%APPDATA%\WinCleaner\WinCleaner.log`
- **Runs with full admin rights (UAC prompt)**

---

## 🛠️ How To Use

1. **Download or clone this repo.**
2. **Run `WinCleaner.bat` as administrator** (right-click > Run as administrator).
   - The launcher will handle UAC elevation and start the main script.
3. **Follow the on-screen menu** to select cleaning options.

> **Do NOT run `WinCleaner_Elevated.bat` directly.**  
> Always use `WinCleaner.bat` for proper elevation and logging.

---

## ⚠️ Disclaimer

- This tool is for educational purposes only.
- Use at your own risk. The author is **not responsible** for any damages or data loss.
- Always review what you are deleting, especially when cleaning driver folders or the Recycle Bin.

---

## 📋 Menu Options

| Option | Action                        |
|--------|-------------------------------|
| 1      | Clean Temp Folders            |
| 2      | Clean Driver Caches           |
| 3      | Verify System Files           |
| 4      | Clear Prefetch Caches         |
| 5      | Repair System Image           |
| 6      | Clean Windows Temp            |
| 7      | Clean Browser Caches          |
| 8      | List Suspicious Tasks         |
| 9      | Empty Recycle Bin             |
| 10     | Exit WinCleaner               |

---

## 📝 Logging

All actions are logged to:  
`%APPDATA%\WinCleaner\WinCleaner.log`

---

## 💡 Tips

- For best results, close all browsers and apps before running.
- Review the log file if you want to see what was deleted.
- You can extend the script with more cleaning options (see source code comments for ideas).

---

## 📜 License

This project is released as-is, for free, with no warranty.

---

**Created by @Nokky — 2025**