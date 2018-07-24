var webpack = require('webpack')
var path = require('path');
var ExtractTextPlugin = require('extract-text-webpack-plugin')
// var Clean = require('clean-webpack-plugin')

module.exports = {
  entry: {
    main: './source/assets/javascripts/application.js'
  },

  output: {
    path: path.resolve(__dirname, '.tmp/dist'),
    filename: 'assets/javascripts/[name].bundle.js'
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      },

      {
        test: /\.scss$/,
        use: [
          'style-loader',
          {
            loader: 'css-loader',
            options: {
              importLoaders: 2
            }
          },
          'postcss-loader',
          'sass-loader'
        ]
      },

      {
        test: /\.(png|svg|jpg|gif)$/,
        use: [
          {
            loader: 'file-loader',
            options: {
              context: './images',
              outputPath: 'images/'
            }
          }
        ]
      }
    ]
  },
  plugins: [
    // new Clean(['.tmp']),
    new ExtractTextPlugin({
      filename: 'assets/stylesheets/[name].bundle.css'
    })
  ]
};
