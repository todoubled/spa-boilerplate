# Using Node.js as a Development Tool - 2.14.12

#### Build Small Footprint Clients to Connect with APIs

This project was inspired by the goal of creating the smallest client deployment possible. Known as Single Page Applications (SPA), they are typically characterized by just a single page load JavScript client with a remote backend API.

Everything in app/src gets bundled up into just 1 HTML file, 1 JavaScript file, 1 CSS file, and 1 image sprite. I use various Node.js modules to keep the entire dev stack in a single programming language.

This is still under development but there's a lot here you can use as
is.
### TODO:
* image spriting task
* ssh deployment task
* S3 deployment
* Scaffolding

## What's included

### Development
* CoffeeScript & Stylus compilation
* File watcher/compiler

### Testing
* linter
* unit tests

### Building
* minification & concatenation
* dependency management
* image spriting

### Documentation
* docco


## Install
1. Clone repo and modify as desired
2. npm install


## Use
```make server``` will start a development server at localhost:1110


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
