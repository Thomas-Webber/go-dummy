
help:
	@fgrep -h "##" Makefile | fgrep -v "fgrep" | sed -r 's/(.*):.*##(.*)/\1:\2/' - | column -s: -t | sed -e 's/##//'

## Docker
login: ## Login to registry
	docker login quay.io

build: ## Build docker image and add tags
	docker build . -t ${IMAGE}:${TAG}

push: ## Push docker image to repository
	docker push ${IMAGE}:${TAG}

run: ## Run docker image
	docker run -it -p 8080:8080 ${IMAGE}:${TAG}

##
## Kubernetes
deploy: ## Deploy to kubernetes by creating a deployment
	kubectl create deployment go-dummy --image 

expose: ## Deploy