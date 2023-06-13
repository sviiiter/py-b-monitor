cd ./../
docker build -t gersvit -f docker/Dockerfile .
docker run -v $(pwd):/app -d gersvit /bin/bash | tee docker/container.id