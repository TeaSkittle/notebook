@echo off
ECHO "| ========================================================= |"
ECHO "|                                                           |"
ECHO "| RUN AS ADMIN!!!!                                          |"
ECHO "|                                                           |"
ECHO "| This batch file will do the following:                    |"
ECHO "|  1. Set correct DNS/DHCP settings                         |"
ECHO "|  2. Obtain the correct proxy settings                     |"
ECHO "|  3. Turn off Windows firewall                             |"
ECHO "|  4. Change SusClientId on registry                        |"
ECHO "|  5. Update the group policy settings                      |"
ECHO "|  6. Set update hours to 8:00-9:00 AM                      |"
ECHO "|  7. Set update service to start with windows              |"
ECHO "|  8. Autostart Windows Services                            |"
ECHO "|  9. Update time settings                                  |"
ECHO "|  10 Delete temporary files                                |"
ECHO "|  11. Force Windows 10 to update                           |"
ECHO "|                                                           |"
ECHO "|   **To finish, restart computer after updates complete**  |"
ECHO "|========================================================== |"
ECHO.
ECHO "| ================================= |"
ECHO "|   Set correct DNS/DHCP settings   |"
ECHO "| ================================= |"
ECHO.
:: This loop changes the DNS settings for all ethernet adapters
SETLOCAL EnableDelayedExpansion
SET adapterName=
FOR /F "tokens=* delims=:" %%a IN ('IPCONFIG ^| FIND /I "ETHERNET ADAPTER"') DO (
SET adapterName=%%a
:: Removes "Ethernet adapter" from the front of the adapter name
SET adapterName=!adapterName:~17!
:: Removes the colon from the end of the adapter name
SET adapterName=!adapterName:~0,-1!
netsh interface ipv4 set dns name="!adapterName!" static 192.168.10.5 primary
)
:: Change registry keys for dns
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DhcpNameServer /t REG_SZ /d 192.168.10.5 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DhcpDomain /t REG_SZ /d sbsu.com /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v SearchList /t REG_SZ /d sbsu.com /f
ipconfig /flushdns
ECHO.
ECHO "| ================================= |"
ECHO "|   Obtain correct proxy settings   |"
ECHO "| ================================= |"
ECHO.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d 192.168.12.7:8080  /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d *.sbsu.com;192.168*;ewire.fisglobal.com;intercept.fnfis.com;216.189.227.*;209.149.158.4;170.209.0.2;170.209.0.3;10.96.41.11;10.96.41.12;10.96.41.23;10.96.139.45;10.96.139.34;10.96.139.57;172.20.250.205;172.20.250.198;172.20.250.181;10.96.139.44;10.96.41.*;64.84.30.94;10.118.26.220;*metavante.com*;bam;lpdpwebapp*;ssb-webapp*;sbmail;ccxvision;<local>  /f
netsh winhttp import proxy source =ie
ECHO.
ECHO "| ================================= |"
echo "|     Turn off windows firewall     |"
ECHO "| ================================= |"
ECHO.
netsh advfirewall set allprofiles state off
ECHO.
ECHO "| ================================= |"
ECHO "|  Change SusClientId in registry   |"
ECHO "| ================================= |"
ECHO.
net stop wuauserv
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f
net start wuauserv
wuauclt /resetauthorization /detectnow
ECHO.
ECHO "| ================================= |"
ECHO "|    Update Group Policy settings   |"
ECHO "| ================================= |"
ECHO.
gpupdate /force /wait:10
ECHO.
ECHO "| ================================= |"
ECHO "| Set update hours to 8:00-9:00 AM  |"
ECHO "| ================================= |"
ECHO.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v SetActiveHours /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ActiveHoursStart /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ActiveHoursEnd /t REG_DWORD /d 9 /f
ECHO.
ECHO "| ================================= |"
ECHO "|    Autostart Windows Services     |"
ECHO "| ================================= |"
ECHO.
sc config wuauserv start=auto
sc config W32Time start=auto
sc config BITS start=auto
sc config CryptSvc start=auto
net start wuauserv
net start W32Time
net start msiserver
net start BITS
net start CryptSvc
ECHO.
ECHO "| ================================= |"
ECHO "|       Update time settings        |"
ECHO "| ================================= |"
ECHO.
net stop w32time
tzutil /s "Mountain Standard Time"
net start w32time
w32tm /resync /rediscover
ECHO.
ECHO "| ================================= |"
ECHO "|      Delete temporary files       |"
ECHO "| ================================= |"
ECHO.
del /s /f /q %temp%
ECHO.
ECHO "| ================================= |"
ECHO "|    Force Windows 10 to update     |"
ECHO "| ================================= |"
ECHO.
wuauclt /detectnow
UsoClient.exe StartInteractiveScan 
ECHO.
ECHO "| ================================= |"
ECHO "|              COMPLETE             |"
ECHO "| ================================= |"
ECHO. 
@echo on
