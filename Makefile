docker_build:
	docker build --no-cache --rm -m 2G -t yvv4docker/mpd-server -f Dockerfile .

docker_run:
	docker run --rm --name mpd-server --privileged=true -v /home/yvv/Music/:/mnt/music -p 6600:6600 -p 8000:8000 yvv4docker/mpd-server