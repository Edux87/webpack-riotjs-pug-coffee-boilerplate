const webpack = require("webpack");
const config = require("config");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const path = config.app.web.paths;


const extractHTML = new HtmlWebpackPlugin({
  filename: path.base + path.dist + "/index.html",
  template: path.base + path.template,
  inject: true
});

module.exports = {
  context: path.base + path.src,
  entry: {
    main: path.base + path.src + "/main.coffee"
  },
  output: {
    path: path.base + path.dist,
    filename: "[name].bundle.js"
  },
  module: {
    rules: [
      {
        test: /\.pug$/,
        use: ["html-loader?attrs=false", "pug-html-loader"]
      },
      {
        test: /\.(png|jpg|gif)$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "file-loader",
            options: {
              name: "[path][name].[ext]",
              emitFile: false,
              context: ""
            },
          }
        ]
      },
      {
        test: /\.(tag|tag.pug)$/,
        use: [
          {
            loader: "riot-tag-loader",
            options: {
              template: "pug"
            }
          }
        ]
      },
      {
        test: /\.coffee$/,
        use: [
          {
            loader: "coffee-loader",
            options: {
              transpile: {
                presets: ["@babel/preset-env"]
              }
            }
          }
        ]
      }, {
        test: /\.(sa|sc|c)ss$/,
        exclude: /node_modules/,
        use: [
          "style-loader", // creates style nodes from JS strings
          "css-loader", // translates CSS into CommonJS
          "postcss-loader",
          "sass-loader"
        ]
      }, {
        test: /\.(woff(2)?|ttf|eot|svg|png)(\?v=\d+\.\d+\.\d+)?$/,
        loader: "url-loader?name=dist/[hash].[ext]"
      }
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({ riot: "riot" }),
    extractHTML,
    new webpack.DefinePlugin({
      "__CONFIG_APP": JSON.stringify(config.app)
    })
  ]
}
