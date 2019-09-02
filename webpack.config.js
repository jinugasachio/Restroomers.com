const path = require('path');
const VueLoaderPlugin = require('vue-loader/lib/plugin');
const ManifestPlugin = require('webpack-manifest-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');


module.exports = (env, argv) => {
  const isProduction = argv.mode === 'production';
  return {
    context: path.resolve(__dirname, 'frontend/packs'),
    entry: {
      javascript: './application.js',
      stylesheet: './application.scss',
      // hello_vue: './hello_vue.js',
    },
    output: {
      path: path.resolve(__dirname, 'public/packs'),
      filename: isProduction ? '[name]-[contentHash].js' : '[name]-[hash].js',
    },
    module: {
      rules: [
        {
          test: /\.js$/,
          include: path.resolve(__dirname, 'app'),
          use: 'babel-loader',
        },
        { test: /\.(css|scss|sass)$/, use: [MiniCssExtractPlugin.loader,'css-loader','sass-loader']},
        {
          test: /\.(png|jpg|gif)$/,
          use: [
            {
              loader: 'file-loader',
              options: {
                outputPath: 'images/',
                name: '[name]-[hash].[ext]',
              },
            },
          ],
        },
        {
          test: /\.vue$/,
          exclude: /node_modules/,
          loader: 'vue-loader',
          options: {
            extractCSS: true,
          },
        },
      ],
    },
    plugins: [
      new VueLoaderPlugin(),
      new ManifestPlugin(),
      new MiniCssExtractPlugin({filename: '[name]-[contentHash].css'}),
    ],
    devServer: {
      host: '0.0.0.0',
      publicPath: 'http://0.0.0.0:3035/public/packs/',
      historyApiFallback: true,
      disableHostCheck: true,
      hot: true,
      port: 3035,
    },    
  };
}