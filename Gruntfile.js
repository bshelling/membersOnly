module.exports = function (grunt) {

    grunt.initConfig({
        uglify: {
            dev: {
                files: { 
                    'dist/js/app.js': ['js/**/*.js']
                }
            }
        },
        sass: {
            dev: {
                files: {
                    'dist/css/app.css': ['/home/bshelling/Projects/wptemplate/wp-content/themes/wptemaplate_twig/sass/app.sass']
                },
                trace: true
            }
        },
        watch: {
            dev: {
                files: ['Gruntfile.js','<%= sass.dev.files %>','<%= uglify.dev.files %>'],
                tasks: ['sass:dev','uglify:dev'],
                options: {
                    interval: 1000
                }

            }
        }


    })

    // Loading Grunt plugins and tasks
    grunt.loadNpmTasks('grunt-contrib-uglify')
    grunt.loadNpmTasks('grunt-contrib-sass')
    grunt.loadNpmTasks('grunt-contrib-watch')

    grunt.verbose

    // Register task 
    grunt.registerTask('default', ['uglify'])
    grunt.registerTask('dev', ['uglify:dev', 'sass:dev'])
    grunt.registerTask('watch', ['watch:dev'])
}