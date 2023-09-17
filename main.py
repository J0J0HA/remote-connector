import flask
import yaml
from io import StringIO, BytesIO

# arches: win32, amd64, arm64


config = yaml.load(open('config.yml', 'r'), yaml.Loader)
app = flask.Flask(__name__)


def dl_template(path, dl_name, **kwargs):
    stringb = BytesIO()
    stringb.write(bytes(flask.render_template(path, server_address=flask.request.host_url, **config, **kwargs), encoding='utf-8'))
    stringb.seek(0)
    return flask.send_file(stringb, download_name=dl_name or "Unnamed Download", as_attachment=True)

@app.route('/installer/<string:arch>.bat')
def installer(arch):
    return dl_template("resources/installer/installer.bat", "installer.bat", arch=arch)

@app.route('/oci/<string:arch>.bat')
def get_oci(arch):
    return dl_template("resources/oci.bat", "oci.bat", arch=arch)

@app.route('/resources/installer/<string:arch>.exe')
def fetch_pythoni(arch):
    return flask.send_file(f"templates/resources/installer/{arch}.exe")

@app.route('/resources/<path:path>')
def fetch_file(path):
    return dl_template("resources/" + path, None)

if __name__ == '__main__':
    app.run(debug=True)
