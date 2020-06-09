# Full Stack Example

This is a template repository that use VUE+GO+Python go build web application.
We use Vue to build front end, and use Go Gin as stack web service.
For the backend API, we use Python flask API. The correspond folder for each part is

- ./apis - for Python Flask API
- ./routers - for Go Gin server
- ./web - for Vue

# Development

Please ensure you have installed:

- Python v3.6
- Node v12
- Go v1.13

Run below command for install dependencies:

```sh
pip install .
cd web
npm install
```

For testing, first start python Flask server with:

```sh
python main.py
```

And then, start web:

```sh
cd web
npm run serve
```

Notice that Python server default runs on port :3000.
You may need to setup Vue's `.env.development` to proxy API request to :3000 port.

> You don't need to run Go while development. We use it only in production.


# Build and deploy

You can use docker to deploy this project. Please refer to then Dockerfile for detail.
To deploy to Google Cloud, try commands like:

```sh
gcloud builds submit --tag gcr.io/benno-lin/fullstack
gcloud run deploy fullstack --platform managed --region asia-east1 --image gcr.io/benno-lin/fullstack
```

Above commands will deploy to Google could run with manged platform.

# Known Issue

Since we use traefik to route, there is a latency before backend API start up.
Therefore, user my be able to access web service before backend API ready.
The possible solution would be:

1. Wait for Python server start before start traefik
2. Speed up Python boot up time
