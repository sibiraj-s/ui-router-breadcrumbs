'use strict'

banner = '/*!\n * @module <%= pkg.name %>\n' +
  ' * @description <%= pkg.description %>\n' +
  ' * @version v<%= pkg.version %>\n' +
  ' * @link <%= pkg.homepage %>\n' +
  ' * @licence MIT License, https://opensource.org/licenses/MIT\n' +
  ' */\n\n';

module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

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
          'docs/style.css': 'docs/style.scss'
      dist:
        files:
          'dist/ui-router-breadcrumbs.css': 'src/ui-router-breadcrumbs.scss'

    cssmin:
      options:
        sourceMap: true
      target:
        files:
          'dist/ui-router-breadcrumbs.min.css': 'dist/ui-router-breadcrumbs.css'

    concat:
      options:
        stripBanners: true
        banner: banner
      dist:
        files:
          'dist/ui-router-breadcrumbs.js': ['dist/ui-router-breadcrumbs.js']
          'dist/ui-router-breadcrumbs.css': ['dist/ui-router-breadcrumbs.css']

    uglify:
      options:
        sourceMap: true
        output:
          comments: '/^!/'
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
          base: './'
          keepalive: true
          livereload: true
          open: true,
          hostname: 'localhost'

    watch:
      coffeescript:
        files: ['src/*.coffee']
        tasks: ['default']
      sass:
        files: ['src/**/*.scss', 'docs/**/*.scss']
        tasks: ['sass']
      css:
        files: ['dist/**/*.css', 'docs/**/*.css']
        options:
          livereload: true
      html:
        files: ['docs/**/*.html']
        options:
          livereload: true
      js:
        files: ['docs/**/*.js', 'dist/**/*.js']
        options:
          livereload: true

  # Grunt task(s).
  grunt.registerTask "default", ["coffeelint", "coffee"]
  grunt.registerTask "serve", ["connect"]
  grunt.registerTask "develop", ["default", "watch"]
  grunt.registerTask "build", ["default", "ngAnnotate", "sass", "concat", "uglify", "cssmin"]

  return
