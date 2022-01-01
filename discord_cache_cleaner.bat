@echo off
@title = "Discord Cache Cleaner by danielytuk & Mad_Tom05"

tasklist | find /i "Discord.exe" && taskkill /im Discord.exe /F
tasklist | find /i "DiscordCanary.exe" && taskkill /im DiscordCanary.exe /F
tasklist | find /i "DiscordPTB.exe" && taskkill /im DiscordPTB.exe /F
tasklist | find /i "DiscordDevelopment.exe" && taskkill /im DiscordDevelopment.exe /F

del /f /s /q %AppData%\Discord\Cache\*.*
del /f /s /q %AppData%\discord\Cache\*.*
del /f /s /q %AppData%\discordcanary\Cache\*.*
del /f /s /q %AppData%\discordptb\Cache\*.*
del /f /s /q %AppData%\DiscordDevelopment\Cache\*.*

exit
