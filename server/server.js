/**
 * Created by Alex on 19/11/2016.
 */
module.exports = Server;

var express = require('express');
var cors = require('cors');
var app = express();

var Root = require('./models/Root');

function Server() {

  var routes = [
    {path: '/insurer/register', action: function (req, res) {
      Root.registerInsurer(function () {

        res.respond(JSON.stringify(true));

      })
    }},
    {path: '/retailer/register', action: function (req, res) {
      Root.registerRetailer(function () {
        res.respond(JSON.stringify(true));
      })
    }},
    {path: '/insurer/registerAgreement', action: function (req, res) {

      console.log('registerAgreement', req.body);

      Root.registerRetailer(function (response) {
        res.respond(JSON.stringify(response));
      })
    }},
  ];

  // setup cors
  app.use(cors());

  routes.forEach(function (item, index) {
    app.get(item.path, item.action);
  });

  app.listen(1111, function () {
    console.log('Example app listening on port 3000!')
  });
}

