docker build -t nakul/complex-clientapp:latest ./Complex/client
docker build -t nakul/complex-server:latest ./Complex/server
docker build -t nakul/complex-worker:latest ./Complex/worker
docker tag nakul/complex-clientapp $DOCKER_ID/complex-clientapp:latest
docker tag nakul/complex-server $DOCKER_ID/complex-server:latest
docker tag nakul/complex-worker $DOCKER_ID/complex-worker:latest
docker tag nakul/complex-clientapp $DOCKER_ID/complex-clientapp:$GIT_SHA
docker tag nakul/complex-server $DOCKER_ID/complex-server:$GIT_SHA
docker tag nakul/complex-worker $DOCKER_ID/complex-worker:$GIT_SHA
docker push $DOCKER_ID/complex-clientapp:latest
docker push $DOCKER_ID/complex-server:latest
docker push $DOCKER_ID/complex-worker:latest
docker push $DOCKER_ID/complex-clientapp:$GIT_SHA
docker push $DOCKER_ID/complex-server:$GIT_SHA
docker push $DOCKER_ID/complex-worker:$GIT_SHA
kubectl apply -f ./Complex/k8s
kubectl set image deployments/server-deployment server=$DOCKER_ID/complex-server:$GIT_SHA
kubectl set image deployments/client-deployment client=$DOCKER_ID/complex-clientapp:$GIT_SHA
kubectl set image deployments/worker-deployment worker=$DOCKER_ID/complex-worker:$GIT_SHA
