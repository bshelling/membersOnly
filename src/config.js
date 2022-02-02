const path = require('path')
const miniCss = require('mini-css-extract-plugin')

const styles = {
    entry: './src/styles.js',
    module:{
        rules:[
            {
                test: /\.(sass|scss)$/,
                use: [miniCss.loader,{
                    loader: 'css-loader',
                    options: {
                        sourceMap: true
                    }
                },{
                    loader: 'sass-loader',
                    options: {
                        sourceMap: true
                    }
                }]
            }
        ]
    },
    plugins:[
        new miniCss({
            filename: '../ctmd/css/site.css'
        })
    ]
}

const scripts = {
    entry: './src/scripts.js',
    output: {
        path: path.resolve(__dirname,'../ctmd/js'),
        filename: 'site.js'
    },
    module: {
        rules:[
            {
                test: /\.(js)$/,
                use: 'babel-loader',
                exclude: /node_modules/
            }
        ]
    }
}

module.exports.styles = styles
module.exports.scripts = scripts