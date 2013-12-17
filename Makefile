BIN=./node_modules/.bin

MOCHA=$(BIN)/mocha
COFFEE=$(BIN)/coffee

compile:
	$(COFFEE) --js <index.coffee >lib/index.js

.PHONY: test compile

test:	compile
	$(MOCHA) --compilers coffee:coffee-script-redux/register --reporter spec --colors test/
