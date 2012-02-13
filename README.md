# Using Node.js as a Development Tool - 2.14.12

#### Build Small Footprint Clients to Connect with APIs


## Development
* CoffeeScript & Stylus compilation
* File watcher/compiler

## Testing
* linter
* unit tests
* headless browser with zombie

## Building
* minification & concatenation
* dependency management
* image spriting

## Documentation
* docco


### Install
1. Clone Cakefile, linter.json, package.json, and server.coffee into the directory structure below
2. npm install
3. npm install -g coffee-script


### Use
Run ```cake``` to see available tasks. ```cake start``` will get you up and running for development.


### Directory Structure
--project
--|--Cakefile
--|--package.json
--|--linter.json
--|--server.coffee
--|--app/
-----|--public
-----|--spec
-----|--src
--------|--images
--------|--javascripts
--------|--stylesheets
--------|--coffeescripts
-----------|--controllers
-----------|--collections
-----------|--models
-----------|--views


### TODO:
* zombie testing task
* image spriting task
* write unit tests
* deployment task
