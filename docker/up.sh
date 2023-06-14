cd ./../
docker build -t gersvit -f docker/Dockerfile .
docker run --env-file $(pwd)/docker/.env -v $(pwd):/app -d gersvit /bin/bash | tee docker/container.id