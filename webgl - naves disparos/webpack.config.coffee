HtmlWebpackPlugin = require('html-webpack-plugin')
webpack = require('webpack')
path = require('path')
UglifyJsPlugin = require('uglifyjs-webpack-plugin')

config =
  entry: './src/main'
  output:
    path: path.resolve(__dirname, 'dist')
    filename: 'bundle.js'
  module: rules: [ {
    test: /\.coffee$/,
    loader: "coffee-loader"
    options: transpile: presets: ['env']
  } ]
  resolve: extensions: [".web.coffee", ".web.js", ".coffee", ".js"]
  plugins: [
    new HtmlWebpackPlugin()
  ]



module.exports = config
