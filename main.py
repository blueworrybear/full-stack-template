import os
import gunicorn.app.base
from flask import Flask
from apis import api
app = Flask(__name__)


class StandaloneApplication(gunicorn.app.base.BaseApplication):

    def __init__(self, app, options=None):
        self.options = options or {}
        self.application = app
        super(StandaloneApplication, self).__init__()

    def load_config(self):
        config = {}
        for key, value in self.options.items():
            if key in self.cfg.settings and value is not None:
                config[key] = value
        for key, value in config.items():
            self.cfg.set(key.lower(), value)

    def load(self):
        return self.application


if __name__ == "__main__":
    api.init_app(app)
    port = "3000"
    workers = 1
    if os.environ.get("PRODUCTION", False):
        port = serve_at_base()
        workers = 10
    options = {
        'bind': '%s:%s' % ('0.0.0.0', port),
        'workers': workers,
    }
    StandaloneApplication(app, options).run()
