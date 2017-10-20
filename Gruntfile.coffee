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
        files: ['docs/**/*.scss']
        tasks: ['sass']
      demoHtml:
        files: ['docs/**/*.html']
      demoJs:
        files: ['docs/**/*.js']
      options:
        livereload: true

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

  # Grunt task(s).
  grunt.registerTask "default", ["coffeelint", "coffee"]
  grunt.registerTask "serve", ["connect"]
  grunt.registerTask "develop", ["default", "watch"]
  grunt.registerTask "dist", ["default", "ngAnnotate", "sass", "concat", "uglify", "cssmin"]

  return
