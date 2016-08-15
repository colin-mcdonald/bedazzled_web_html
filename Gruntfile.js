module.exports = function (grunt) {
    grunt.initConfig({
        less: {
            development: {
                options: {
                    strictImports: true,
                    strictMath: true,
                    syncImport: true,
                    relativeUrls: true,
                    sourceMap: true,
                    sourceMapFileInline: true,
                    ieCompat: false,
                    //plugins: ["autoprefix"],
                    compress: false
                },
                files: {
                    'cssd/bedazzled.css': ['less/bedazzled.less']
                }
            },
            production: {
                options: {
                    strictImports: true,
                    strictMath: true,
                    syncImport: true,
                    relativeUrls: true,
                    sourceMap: false,
                    sourceMapFileInline: false,
                    ieCompat: true,
                    //plugins: ["autoprefix"],
                    compress: true
                },
                files: {
                    'css/bedazzled.css': ['less/bedazzled.less']
                }
            }

        }
    });

    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.registerTask('default', ['less']);
};
