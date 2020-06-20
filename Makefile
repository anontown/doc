.PHONY: noop
noop:
	echo

.PHONY: deps
deps:
	npm i
	npx gitbook install

.PHONY: serve
serve:
	docker-compose up --build
