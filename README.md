# PythonFlaskApp

Kind Cluster setup local
-------------------------
1. Install lens
2. brew install docker
3. brew install kubectl
4. brew install kind
5. kind get clusters
6. kind create cluster --name mykindcluster --config /Users/sumapunna/Documents/Learnings/MyGItRepositories/KubernetesDeployments/kind-config.yaml



Python project setup local:
----------------------------
### Install python locally 
1. brew install python
2. python3 --version
3. python3 -m pip install --upgrade pip

### Setup a Virtual Env --->
python3.11 -m venv venv
source venv/bin/activate
cd venv


Application overview:
--------------------

kubectl port-forward -n pythonapp service/unicorn-service 8000:8000
A root endpoint /:
Returns: { "message": "Welcome to the Unicorn API!" }
A dynamic endpoint /unicorns/{unicorn_id}:
Example: /unicorns/sparkle
Returns a unicorn's info if it exists
Returns an error if not found


Swagger UI: http://localhost:8000/docs
How to test it (unicorn uid- sparkle)
Curl:
curl http://localhost:8000/
curl http://localhost:8000/unicorns/sparkle

Docker:
docker build -t unicorn-api .
docker run -p 8000:8000 unicorn-api -- to run locally

load application image to cluster -->
kind load docker-image <image-name> --name <cluster-name>


