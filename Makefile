all: test_actions/static/index.html client/dist/index.html

client/dist/index.html: client/index.html client/*.json client/*.ts $(shell find client/src)
	cd client && npm install
	cd client && npm run build

test_actions/static/index.html: client/dist/index.html
	rm -rf test_actions/static
	mkdir -p test_actions/static
	cp -r client/dist/* test_actions/static/
