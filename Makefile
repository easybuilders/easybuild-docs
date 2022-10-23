all: build

build: docs mkdocs.yml
	mkdocs build

deploy:
	mkdocs gh-deploy --force

check test:
	mkdocs build --strict

preview:
	mkdocs serve
