@echo off
set proj=wumpdump
title %proj%

set "path=%cd%"
set "cache=cache\Cache_Data"

if exist "%cd%\deps" (
    rmdir /s /q "%cd%\deps"
)

mkdir "deps" && cd "deps"

"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" iwr -Uri https://mark0.net/download/trid_w32.zip -OutFile "trid_dl.zip" -UseBasicParsing
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" iwr -Uri https://mark0.net/download/triddefs.zip -OutFile "trid_dp.zip" -UseBasicParsing
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" iwr -Uri https://github.com/danielytuk/Discord-Cache-Cleaner/raw/v1.0.2/req/quiet.exe -OutFile "quiet.exe" -UseBasicParsing

"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" Expand-Archive -Force "trid_dl.zip" .\
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" Expand-Archive -Force "trid_dp.zip" .\
del "trid_dl.zip" && del "trid_dp.zip"

cd ../ && mkdir cached_files

if exist "%appdata%\discord" (
    copy "%appdata%\discord\%cache%\f_*" "%cd%\cached_files\"
    start "" "%cd%\deps\quiet.exe" "%cd%\deps\trid.exe" "%cd%\cached_files\*.*" -ce >nul
    cls && (
        ForFiles /p "%AppData%\discord\%cache%" /s /M * /d -0 /c "cmd /c del /q @file"
        ForFiles /p "%AppData%\discord\Code Cache" /s /M * /d -0 /c "cmd /c del /q @file"
        ForFiles /p "%AppData%\discord\GPUCache" /s /M * /d -0 /c "cmd /c del /q @file"
    )
)

if exist "%appdata%\discordptb" (
    copy "%appdata%\discordptb\%cache%\f_*" "%cd%\cached_files\"
    start "" "%cd%\deps\quiet.exe" "%cd%\deps\trid.exe" "%cd%\cached_files\*.*" -ce >nul
    cls && (
        ForFiles /p "%AppData%\discordptb\%cache%" /s /M * /d -0 /c "cmd /c del /q @file"
        ForFiles /p "%AppData%\discordptb\Code Cache" /s /M * /d -0 /c "cmd /c del /q @file"
        ForFiles /p "%AppData%\discordptb\GPUCache" /s /M * /d -0 /c "cmd /c del /q @file"
    )
)

if exist "%appdata%\discordcanary" (
    copy "%appdata%\discordcanary\%cache%\f_*" "%cd%\cached_files\"
    start "" "%cd%\deps\quiet.exe" "%cd%\deps\trid.exe" "%cd%\cached_files\*.*" -ce >nul
    cls && (
        ForFiles /p "%AppData%\discordcanary\%cache%" /s /M * /d -0 /c "cmd /c del /q @file"
        ForFiles /p "%AppData%\discordcanary\Code Cache" /s /M * /d -0 /c "cmd /c del /q @file"
        ForFiles /p "%AppData%\discordcanary\GPUCache" /s /M * /d -0 /c "cmd /c del /q @file"
    )
)

if exist "%appdata%\discorddevelopment" (
    copy "%appdata%\discorddevelopment\%cache%\f_*" "%cd%\cached_files\"
    start "" "%cd%\deps\quiet.exe" "%cd%\deps\trid.exe" "%cd%\cached_files\*.*" -ce >nul
    cls && (
        ForFiles /p "%AppData%\discorddevelopment\%cache%" /s /M * /d -0 /c "cmd /c del /q @file"
        ForFiles /p "%AppData%\discorddevelopment\Code Cache" /s /M * /d -0 /c "cmd /c del /q @file"
        ForFiles /p "%AppData%\discorddevelopment\GPUCache" /s /M * /d -0 /c "cmd /c del /q @file"
    )
)

cls && exit
