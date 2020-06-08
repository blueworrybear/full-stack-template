import os
from flask_restplus import Api
from flask import url_for
from .v1 import api as v1


class Custom_API(Api):
    @property
    def specs_url(self):
        '''
        The Swagger specifications absolute url (ie. `swagger.json`)

        :rtype: str
        '''
        if os.environ.get("PRODUCTION", False):
            return "/api" + url_for(
                self.endpoint('specs'), _external=False)
        return url_for(self.endpoint('specs'), _external=False)

    @property
    def base_path(self):
        if os.environ.get("PRODUCTION", False):
            return "/api" + url_for(self.endpoint('root'), _external=False)
        return url_for(self.endpoint('root'), _external=False)


api = Custom_API(
    title='Flask API',
    version='1.0',
    description='Python REST API',
    doc='/doc'
)

api.add_namespace(v1)
