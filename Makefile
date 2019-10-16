build:
	docker image build -t thompatterson/hue-scene-animation:0.1 .

run:
	docker container run --rm -it -p 12000:8080 --name hue-scene-animation thompatterson/hue-scene-animation:0.1

export:
	docker export -o test.tgz hue-scene-animation

push:
	docker push thompatterson/hue-scene-animation:0.1
