const path = require('path')
const miniCss = require('mini-css-extract-plugin')
const { env } = require('process')


const styles = (env,argv) => {
    
    if(env.environment == "development"){
        console.log("------------------------------------------------")
        console.log("---------- Development Styles Build -----------")
        console.log("------------------------------------------------")
        console.log(" ")
    }
    else {
        console.log("------------------------------------------------")
        console.log("---------- Production Styles Build ------------")
        console.log("------------------------------------------------")
    }


    return {
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
    ],
    mode: env.environment == 'development' ? 'development' : 'production'
}
}

const scripts = (env,argv)=>{

    if(env.environment == "development"){
        console.log("------------------------------------------------")
        console.log("---------- Development Scripts Build -----------")
        console.log("------------------------------------------------")
        console.log(" ")
    }
    else {
        console.log("------------------------------------------------")
        console.log("---------- Production Scripts Build ------------")
        console.log("------------------------------------------------")
    }

    return {
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
    },
    mode: env.environment == 'development' ? 'development' : 'production'
    }
}

module.exports.styles = styles
module.exports.scripts = scripts