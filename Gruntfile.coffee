module.exports = (grunt)->
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')

    uglify:
      build:
        files: 'public/typos.min.js': ['public/typos.js']

    concat:
      dist:
        src: ['src/**/*.js']
        dest: 'public/typos.js'

      options:
        separator: ';'

    typescript:
      base:
        src: ['src/**/*.ts']

    compass:
      dist:
        options:
          config: 'config.rb'

    watch:
      ts:
        files: ['src/**/*.ts']
        tasks: ['typescript', 'concat', 'uglify', 'clean']
        options:
          atBegin: true

      css:
        files: ['sass/**/*.scss']
        tasks: ['compass']
        options:
          atBegin: true

    clean: ['src/**/*.js']

    connect:
      server:
        options:
          port: 8000
          base: 'public'
          keepalive: true

  })

  grunt.loadNpmTasks('grunt-contrib-compass')
  grunt.loadNpmTasks('grunt-typescript')
  grunt.loadNpmTasks('grunt-contrib-concat')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-clean')

  grunt.registerTask('default', ['watch'])
  grunt.registerTask('server', ['connect'])
