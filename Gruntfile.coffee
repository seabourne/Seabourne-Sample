###

    Gruntfile

    author: @jeremiahhall

    created: 6/20/14 - 2:52 PM

    description:

###

module.exports = (grunt) ->

  grunt.initConfig

    express:
      dev:
        options:
          cmd: "node_modules/.bin/coffee"
          script: "./server/start.coffee"

    browserify:
      client:
        src: ['client/***/*.coffee']
        dest: "_public/js/main.js"
        options:
          debug: true
          transform: [ 'coffeeify' ]


    mochaTest:
      tests:
        options:
          reporter: 'spec'
          clearRequireCache: true
          timeout: 150000
        src: [ 'tests/*.test.coffee' ]

    watch:
      server:
        files: [ 'server/**/*.coffee', 'server/*.coffee', 'Gruntfile.coffee' ]
        tasks: [ 'express:dev' ]
        options:
          nospawn: true

      client:
        files: [
          'client/scripts/***/*.coffee',
          'client/index.html'
        ]
        tasks: [ 'build:client' ]
        options:
          nospawn: true

    copy:
      client_html:
        files: [
            expand: true
            flatten: true
            src: ['client/*']
            dest: '_public/'
            filter: 'isFile'
          ,
            expand: true
            flatten: true
            src: ['client/css/*']
            dest: '_public/css'
            filter: 'isFile'
        ]

  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-browserify'
  grunt.loadNpmTasks 'grunt-express-server'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.registerTask 'default', [ 'build:client', 'express:dev', 'watch' ]

  grunt.registerTask 'dev:client', [ 'build:client', 'watch:client' ]
  grunt.registerTask 'build:client', [ 'browserify', 'copy' ]

  grunt.registerTask 'test', [ 'mochaTest' ]