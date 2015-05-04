module.exports = function(grunt) {

  grunt.initConfig({

    express: {
      dev: {
        options: {
          script: "./server/start.js"
        }
      }
    },

    browserify: {
      client: {
        src: ['client/***/*.js'],
        dest: "_public/js/main.js",
        options: {
          debug: true
        }
      }
    },

    mochaTest: {
      tests: {
        options: {
          reporter: 'spec',
          clearRequireCache: true,
          timeout: 150000
        },
        src: ['tests/*.test.js']
      }
    },

    watch: {
      server: {
        files: ['server/**/*.js', 'server/*.js', 'Gruntfile.js'],
        tasks: ['express:dev'],
        options: {
          nospawn: true
        }
      },

      client: {
        files: [
          'client/scripts/***/*.js',
          'client/index.html'
        ],
        tasks: ['build:client'],
        options: {
          nospawn: true
        }
      }
    },

    copy: {
      client_html: {
        files: [{
          expand: true,
          flatten: true,
          src: ['client/*'],
          dest: '_public/',
          filter: 'isFile'
        }, {
          expand: true,
          flatten: true,
          src: ['client/css/*'],
          dest: '_public/css',
          filter: 'isFile'
        }]
      }
    }
  })

  grunt.loadNpmTasks('grunt-mocha-test')
  grunt.loadNpmTasks('grunt-browserify')
  grunt.loadNpmTasks('grunt-express-server')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-copy')

  grunt.registerTask('default', [ 'build:client', 'express:dev', 'watch' ])

  grunt.registerTask('dev:client', [ 'build:client', 'watch:client' ])
  grunt.registerTask('build:client', [ 'browserify', 'copy' ])

  grunt.registerTask('test', [ 'mochaTest', 'watch:server' ])
}