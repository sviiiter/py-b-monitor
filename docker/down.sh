cd ..
cat docker/container.id | xargs docker stop | xargs docker rm
docker images -q gersvit:latest | xargs docker rmi
