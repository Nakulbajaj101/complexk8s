docker build -t $DOCKER_USERNAME/complex-clientapp:latest -t $DOCKER_USERNAME/complex-clientapp:$GIT_SHA ./Complex/client
docker build -t $DOCKER_USERNAME/complex-server:latest -t $DOCKER_USERNAME/complex-server:$GIT_SHA  ./Complex/server
docker build -t $DOCKER_USERNAME/complex-worker:latest -t $DOCKER_USERNAME/complex-worker:$GIT_SHA  ./Complex/worker
docker push $DOCKER_USERNAME/complex-clientapp:latest
docker push $DOCKER_USERNAME/complex-server:latest
docker push $DOCKER_USERNAME/complex-worker:latest
docker push $DOCKER_USERNAME/complex-clientapp:$GIT_SHA
docker push $DOCKER_USERNAME/complex-server:$GIT_SHA
docker push $DOCKER_USERNAME/complex-worker:$GIT_SHA
kubectl apply -f ./Complex/k8s
kubectl set image deployments/server-deployment server=$DOCKER_USERNAME/complex-server:$GIT_SHA
kubectl set image deployments/client-deployment client=$DOCKER_USERNAME/complex-clientapp:$GIT_SHA
kubectl set image deployments/worker-deployment worker=$DOCKER_USERNAME/complex-worker:$GIT_SHA
