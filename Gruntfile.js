module.exports = function (grunt) {
    var copyrightBanner = '/* Copyright (C) 2016 Bedazzled Dance Champions, Inc. */';

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
                    plugins: [new (require('less-plugin-autoprefix'))({browsers: ["ie >= 8","> 1% in CA"]})],
                    compress: false,
                    banner: copyrightBanner
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
                    plugins: [new (require('less-plugin-autoprefix'))({browsers: ["ie >= 8","> 1% in CA"]})],
                    compress: true,
                    banner: copyrightBanner
                },
                files: {
                    'css/bedazzled.css': ['less/bedazzled.less']
                }
            }
        },
        coffee: {
            compiledjs: {
                options: {
                    separator: '\n\n// ----------------------------------------------------------------------\n\n',
                    bare: false,
                    join: true
                },
                files: {
                    'jsd/multicarousel.js': 'coffee/multicarousel.coffee',
                    'jsd/bedazzled.js': 'coffee/bedazzled.coffee'
                }
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
                    banner: copyrightBanner,
                    'screwIE8': false
                },
                files: {
                    'js/bedazzled.js': ['jsd/multicarousel.js', 'jsd/bedazzled.js']
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.registerTask('default', ['less', 'coffee', 'uglify']);
};
