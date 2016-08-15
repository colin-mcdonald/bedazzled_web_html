module.exports = function (grunt) {
    grunt.initConfig({
        less: {
            'bedazzled.css': ['bedazzled.less']
        }
    });

    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.registerTask('default', ['less']);
};
