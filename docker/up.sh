cd ./../
docker build -t gersvit -f docker/Dockerfile .
docker run --name=py_b_monitor --env-file $(pwd)/docker/.env -v $(pwd):/app -d gersvit /bin/bash | tee docker/container.id