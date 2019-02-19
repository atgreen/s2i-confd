
IMAGE_NAME = s2i-confd

.PHONY: build
build:
	docker build -t $(IMAGE_NAME) .

