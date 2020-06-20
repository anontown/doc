IMAGE_NAME := at-doc
TAG := $(REPO)/$(IMAGE_NAME):$(VER)

.PHONY: noop
noop:
	echo

.PHONY: check-env
check-env:
ifndef REPO
	$(error REPO is undefined)
endif
ifndef VER
	$(error VER is undefined)
endif

.PHONY: build
build: check-env
	docker build -t $(TAG) .

.PHONY: push
push: check-env
	docker push $(TAG)
