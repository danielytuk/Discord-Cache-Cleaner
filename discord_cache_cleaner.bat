@echo off
@title = "Discord Cache Cleaner by danielytuk"

tasklist | find /i "Discord.exe" && taskkill /im Discord.exe /F
tasklist | find /i "DiscordCanary.exe" && taskkill /im DiscordCanary.exe /F
tasklist | find /i "DiscordPTB.exe" && taskkill /im DiscordPTB.exe /F

del /f /s /q %AppData%\Discord\Cache\*.*
del /f /s /q %AppData%\discord\Cache\*.*
del /f /s /q %AppData%\discordcanary\Cache\*.*
del /f /s /q %AppData%\discordptb\Cache\*.*

exit
