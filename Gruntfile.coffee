'use strict'

module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  history = require('connect-history-api-fallback')

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    coffeelint:
      options:
        configFile: 'coffeelint.json'
      source: ['src/ui-router-breadcrumbs.coffee']

    coffee:
      compileJoined:
        options:
          join: true
        files:
          'dist/ui-router-breadcrumbs.js': ['src/ui-router-breadcrumbs.coffee']

    sass:
      options:
        sourcemap: 'none'
        style: 'expanded'
      demo:
        files:
          'demo/style.css': 'demo/style.scss'
      dist:
        files:
          'dist/ui-router-breadcrumbs.css': 'src/ui-router-breadcrumbs.scss'

    cssmin:
      options:
        sourceMap: true
      target:
        files:
          'dist/ui-router-breadcrumbs.min.css': 'dist/ui-router-breadcrumbs.css'

    watch:
      coffeescript:
        files: ['src/*.coffee']
        tasks: ['default']
      sass:
        files: ['src/**/*.scss']
        tasks: ['sass']
      cssMin:
        files: ['dist/ui-router-breadcrumbs.css']
        tasks: ['cssmin']
      demoCss:
        files: ['demo/**/*.scss']
        tasks: ['sass']
      demoHtml:
        files: ['demo/**/*.html']
      demoJs:
        files: ['demo/**/*.js']
      options:
        livereload: true

    uglify:
      options:
        sourceMap: true
      target:
        files:
          'dist/ui-router-breadcrumbs.min.js': ['dist/ui-router-breadcrumbs.js']

    ngAnnotate:
      options:
        singleQuotes: true

      uiBreadcrumbs:
        files:
          'dist/ui-router-breadcrumbs.js': ['dist/ui-router-breadcrumbs.js']

    connect:
      server:
        options:
          base: 'demo/'
          keepalive: true
          livereload: true
          middleware: (connect, options, middleware) ->
            middleware.unshift(history())
            return middleware

  # Grunt task(s).
  grunt.registerTask "default", ["coffeelint", "coffee"]
  grunt.registerTask "webserver", ["connect"]
  grunt.registerTask "develop", ["default", "watch"]
  grunt.registerTask "dist", ["default", "ngAnnotate", "uglify", "sass", "cssmin"]

  return
