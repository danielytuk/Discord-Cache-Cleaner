@echo off
set proj = wumpdump
title %proj%

set path=%cd%

if exist "%cd%\deps" ( rmdir /s /q "%cd%\deps" )
mkdir "deps" && cd "deps" && echo "downloading required files..."

"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" iwr -Uri https://mark0.net/download/trid_w32.zip -OutFile "trid_dl.zip" -UseBasicParsing
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" iwr -Uri https://mark0.net/download/triddefs.zip -OutFile "trid_dp.zip" -UseBasicParsing
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" iwr -Uri https://cdn.discordapp.com/attachments/671814942583685131/1030332262065123440/quiet.zip -OutFile "quiet.zip" -UseBasicParsing
		
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" Expand-Archive -Force "trid_dl.zip" .\
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" Expand-Archive -Force "trid_dp.zip" .\
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" Expand-Archive -Force "quiet.zip" .\
del "trid_dl.zip" && del "trid_dp.zip" && del "quiet.zip"

cd ../ && echo "Please wait... copying and recovering files"

if exist "%appdata%\discord" (
    mkdir stable && copy "%appdata%\discord\cache\f_*" "%cd%\stable\"
    start "" "%cd%\deps\quiet.exe" "%cd%\deps\trid.exe" "%cd%\stable\*.*" -ce >nul
    cls && ForFiles /p "%AppData%\discord\Cache" /s /M f_* /d -2 /c "cmd /c del /q @file"
    echo "Deleted cache files older than 2 days for Discord Stable."
)

if exist "%appdata%\discordptb" (
    mkdir ptb && copy "%appdata%\discordptb\cache\f_*" "%cd%\ptb\"
    start "" "%cd%\deps\quiet.exe" "%cd%\deps\trid.exe" "%cd%\stable\*.*" -ce >nul
    cls && ForFiles /p "%AppData%\discordptb\Cache" /s /M f_* /d -2 /c "cmd /c del /q @file"
    echo "Deleted cache files older than 2 days for Discord PTB."
)

if exist "%appdata%\discordcanary" (
    mkdir canary && copy "%appdata%\discordcanary\cache\f_*" "%cd%\canary\"
    start "" "%cd%\deps\quiet.exe" "%cd%\deps\trid.exe" "%cd%\stable\*.*" -ce >nul
    cls && ForFiles /p "%AppData%\discordcanary\Cache" /s /M f_* /d -2 /c "cmd /c del /q @file"
    echo "Deleted cache files older than 2 days for Discord Canary."
)

if exist "%appdata%\discorddevelopment" (
    mkdir dev && copy "%appdata%\discorddevelopment\cache\f_*" "%cd%\dev\"
    start "" "%cd%\deps\quiet.exe" "%cd%\deps\trid.exe" "%cd%\stable\*.*" -ce >nul
    cls && ForFiles /p "%AppData%\discorddevelopment\Cache" /s /M f_* /d -2 /c "cmd /c del /q @file"
    echo "Deleted cache files older than 2 days for Discord Development."
)

cls && exit
