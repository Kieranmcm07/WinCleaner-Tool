<div align="center">
  
# `WinCleaner`  
### The Ultimate Windows Optimization Toolkit  
`Version 1.0.0` • `Created by @Nokky`  
  


<img src=".\assets\banner.jpg">
                                                                                 

  
</div>

---

## 📦 Features
```diff
+ Clean Temp Folders          + Verify System Files
+ Clean Driver Caches         + Clear Prefetch Caches
+ Repair System Image         + Clean Windows Temp
+ Clean Browser Caches        + List Suspicious Tasks
+ Empty Recycle Bin
```

---

## ⚡ Quick Start
1. Download both batch files
2. Place in same directory
3. Run WinCleaner.bat (Administrator Required)
```bash
git clone https://github.com/Kieranmcm07/WinCleaner.git
cd WinCleaner
WinCleaner.bat
```

---

## 🖱️ Context Menu Setup
Add WinCleaner to desktop right-click menu:
1. Create WinCleaner.reg file
2. Add following content:
```reg
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\WinCleaner]
@="WinCleaner"
"Icon"="\"%USERPROFILE%\\Path\\To\\WinCleaner.bat\",0"

[HKEY_CLASSES_ROOT\Directory\Background\shell\WinCleaner\command]
@="\"%USERPROFILE%\\Path\\To\\WinCleaner.bat\""
```
3. Update path to match your directory
4. Doublie-click to merge into registry
5. Right-click desktop to access!

---

## 🛡️ Safety Features
```diff
- UAC Elevation Handling     - Confirmation Prompts
- Logging to %APPDATA%       - Safe Deletion Practices
- Backup for Driver Caches   - Error Handling
```

---

## 📝 Usage Notes
```diff
! Requires Administrator privileges
! Use at your own risk (educational purposes)
! Always backup important data first
+ Compatible with Windows 10/11
```

---

## 🪄 Technical Highlights
```py
# ANSI Color Support
# Dynamic Logging System
# Multi-Platform Browser Cleaning
# Suspicious Task Detection
# UTF-8 Encoding Handling
```

<div align="center">
- LEGAL DISCLAIMER: 
! This tool is for educational purposes only.
! Author not responsible for system damages.
! Use with caution on production systems.
</div>