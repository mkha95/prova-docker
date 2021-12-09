ME=$(shell whoami)

build:
	docker build --build-arg myuser=$(shell whoami) --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t ithacafv/ithacafv -f ./Dockerfile .

run:
	xhost +"local:docker" && \
	docker run -ti --rm \
        -v "${HOME}:/home/ithacafv/${ME}" \
		-e DISPLAY=${DISPLAY} \
        --security-opt seccomp=unconfined \
		ithacafv/ithacafv


