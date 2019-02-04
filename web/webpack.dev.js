const merge = require('webpack-merge');
const common = require('./webpack.common.js');
const config = require("config");
const path = config.app.web.paths;


module.exports = merge(common, {
  mode: 'development',
  cache: true,
  stats: {
    modules: true,
    errorDetails: true
  },
  devtool: 'inline-source-map',
  devServer: {
    // stats: "errors-only",
    port: config.app.web.port,
    compress: true,
    contentBase: path.base + path.dist,
    watchOptions: {
      ignored: [
        path.base + path.dist,
        path.base + 'node_modules'
      ]
    }
  }
});
