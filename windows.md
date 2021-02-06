# Windows

## System Commands
* expand - Expands compressed .cab files
* tasklist - Display processes that are runing (DOS version of *NIX ps)
* taskkiill - End a spefific task
* mstsc - Open remote desktop connection utility
* gpupdate - Update group policy settings
* gpresult - Display group p[olicy settings
* shutdown - Power off machine
* w32tm - Windows time settings
* sfc - System File Checker
* chkdsk - Find and repair errors on disk
* netstat - Network Statistics
* systeminfo - Display detailed description of computer components
* net use - Connect to network drive
* tracert - Trace packet path
* nslookup - View dns settings
 
## File Locations
* System Files:
  * C:\Windows\
  * %systemroot%
  * %windir%
* Fonts - C:\Windows\Fonts
* Program Files:
  * C:\Program Files - __62-bit__
  * C:\Program Files(x86) - __32-bit__
  * %programfiles%
* User Files:
  * C:\Users\"UserName"
  * %userprofile%
Temporary Files:
  * C:\Users\UserName\AppData\Local\Temp
  * %temp%
  * %tmp%

## Fix Stuff

* Good command to run for fixing OS issues:
```
sfc /scannow & DISM.exe /Online /Cleanup-image /Scanhealth && DISM.exe /Online /Cleanup-image /Restorehealth & sfc /scannow
```
