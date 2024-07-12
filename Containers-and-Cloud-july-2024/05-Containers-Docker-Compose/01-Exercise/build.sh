docker run -p 8080:8080 -d vue-app

docker build -t vue-app .

docker image tag vue-app miroslavvalsorim/vue-app

docker login

docker push miroslavvalsorim/vue-app

docker inspect image vue:app