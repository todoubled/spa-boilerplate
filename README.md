# Using Node.js as a Development Tool - 2.14.12

#### Build Small Footprint Clients to Connect with APIs

This project was inspired by the goal of creating the smallest client deployment possible. Known as Single Page Applications (SPA), they are typically characterized by just a single page load JavScript client with a remote backend API.

Everything in app/src gets bundled up into just 1 HTML file, 1 JavaScript file, 1 CSS file, and 1 image sprite. I use various Node.js modules to keep the entire dev stack in a single programming language.

This is still under development but there's a lot here you can use as
is.
### TODO:
* expand on example zombie testing task
* image spriting task
* ssh deployment task

## What's included

### Development
* CoffeeScript & Stylus compilation
* File watcher/compiler

### Testing
* linter
* unit tests
* headless browser with zombie

### Building
* minification & concatenation
* dependency management
* image spriting

### Documentation
* docco


## Install
1. Clone Cakefile, linter.json, package.json, and server.coffee into the directory structure below
2. npm install
3. npm install -g coffee-script


## Use
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
