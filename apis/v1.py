
from flask_restplus import Namespace, Resource
api = Namespace("v1", description="v1")


@api.route("/hello")
class Hello(Resource):

    def get(self):
        return "Hello Python API!"
