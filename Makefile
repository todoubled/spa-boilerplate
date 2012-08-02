server :
		./node_modules/.bin/supervisor server.coffee

build :
		./node_modules/.bin/coffee build.coffee

docs :
		./node_modules/.bin/docco app/src/coffeescripts/**/*.coffee

# TODO: Fix these
test :
		./node_modules/.bin/jasmine-node --color --coffee app/spec

lint :
		./node_modules/.bin/coffeelint -f linter.json app/src/coffeescripts/*
