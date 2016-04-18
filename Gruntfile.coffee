module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffee:
      build:
        expand: true
        flatten: true
        cwd: 'coffee'
        src: ['*.coffee']
        dest: 'js/'
        ext: '.js'
    sass:
      build:
        files:
          'css/main.css': 'sass/main.sass'
    watch:
      scripts:
        files: ['coffee/**/*.coffee']
        tasks: ['coffee']
      styles:
        files: ['sass/**/*.sass']
        tasks: ['sass']

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-sass')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask('default', ['coffee', 'sass'])