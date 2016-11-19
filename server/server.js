/**
 * Created by Alex on 19/11/2016.
 */
module.exports = Server;



var express = require('express');
var app = express();

function Server() {

  var Insurer = {
    register:function (request, res) {
      console.log('register insurer');
      res.send('registered insurer');
    }
  }
  var Retailer = {
    register:function (request, res) {
      console.log('registered retailer');
      res.send('registered retailer');
    }
  };

  var routes = [
    {path: '/insurer/register', action: Insurer.register},
    {path: '/retailer/register', action: Insurer.register},
  ]

  routes.forEach(function (item, index) {
    app.get(item.path, item.action);
  });

  app.listen(1111, function () {
    console.log('Example app listening on port 3000!')
  });
}





