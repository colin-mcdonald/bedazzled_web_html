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
        },
        coffee: {
            development: {
                options: {
                    separator: '\n\n// ----------------------------------------------------------------------\n\n',
                    bare: false,
                    join: true
                },
                src: 'coffee/multicarousel.coffee',
                dest: 'jsd/multicarousel.js'
            },
            production: {
                options: {
                    join: true
                },
                src: 'coffee/multicarousel.coffee',
                dest: 'js/multicarousel.js'
            }
        },
        uglify: {
            production: {
                options: {
                    compress: true,
                    mangle: {
                        except: ['$']
                    },
                    preserveComments: false,
                    banner: '/* Copyright (C) 2016 Bedazzled Dance Champions, Inc. */',
                    'screwIE8': false
                },
                src: 'js/multicarousel.js',
                dest: 'js/multicarousel.js'
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.registerTask('default', ['less', 'coffee', 'uglify']);
};
