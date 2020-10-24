dartSass = require('sass')
loadGruntTasks = require('load-grunt-tasks')

banner = '/*!\n * @module <%= pkg.name %>\n' +
  ' * @description <%= pkg.description %>\n' +
  ' * @version v<%= pkg.version %>\n' +
  ' * @link <%= pkg.homepage %>\n' +
  ' * @licence MIT License, https://opensource.org/licenses/MIT\n' +
  ' */\n\n';

module.exports = (grunt) ->
  loadGruntTasks(grunt)

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean:
      outDir:
        src: 'dist/'

    coffeelintr:
      options:
        configFile: 'coffeelint.json'
      source: ['src/ui-router-breadcrumbs.coffee', 'Gruntfile.coffee']

    coffee:
      compileJoined:
        options:
          join: true
        files:
          'dist/ui-router-breadcrumbs.js': ['src/ui-router-breadcrumbs.coffee']

    sass:
      options:
        implementation: dartSass
        sourcemap: 'none'
        style: 'expanded'
      demo:
        files:
          'docs/style.css': 'docs/style.scss'
      lib:
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

    copy:
      default:
        expand: true
        src: ['LICENSE', 'README.md', 'CHANGELOG.md']
        dest: 'dist/'
      pkgJson:
        expand: true
        src: 'package.json'
        dest: 'dist/',
        options:
          process: (data) ->
            pkg = JSON.parse(data)
            pkg.main = 'ui-router-breadcrumbs.min.js'
            delete pkg.scripts
            delete pkg.devDependencies
            delete pkg.private
            delete pkg.engines
            JSON.stringify pkg, null, 2

    browserSync:
      bsFiles:
        src: [
          'docs/*.css',
          'docs/**/*.html',
          'docs/*.js',
          'dist/*.js',
          'dist/*.css'
        ]
      options:
        watchTask: true
        open: false
        server:
          baseDir: 'docs'
          routes:
            '/dist': 'dist'
        rewriteRules: [{
          match: 'https://cdn.jsdelivr.net/npm/ui-router-breadcrumbs@latest/ui-router-breadcrumbs.min.js',
          replace: '/dist/ui-router-breadcrumbs.js',
        }, {
          match: 'https://cdn.jsdelivr.net/npm/ui-router-breadcrumbs@latest/ui-router-breadcrumbs.min.css',
          replace: '/dist/ui-router-breadcrumbs.css'
        }]

    watch:
      coffeescript:
        files: ['src/*.coffee']
        tasks: ['default']
      sass_lib:
        files: ['src/**/*.scss']
        tasks: ['sass:lib']
      sass_demo:
        files: ['docs/**/*.scss']
        tasks: ['sass:demo']

  # Grunt task(s).
  grunt.registerTask 'default', ['coffee', 'sass:lib']
  grunt.registerTask 'serve', ['default', 'browserSync', 'watch']
  grunt.registerTask 'build', ['clean', 'default', 'sass', 'concat', 'uglify', 'cssmin', 'copy']

  return
