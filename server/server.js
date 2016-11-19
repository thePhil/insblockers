/**
 * Created by Alex on 19/11/2016.
 */
module.exports = Server;

var express = require('express');
var cors = require('cors');
var app = express();

var utils = require('../Utils');

var Root = require('./models/Root');
var RetailerAgreement = require('./models/RetailerAgreement')

function Server() {

  var routes = [
    {
      path: '/insurer/register', action: function (req, res) {
      Root.registerInsurer(function () {

        res.send(JSON.stringify({message: "You have successfully registered as an insurer please check your mail for more details."}));

      })
    }
    },
    {
      path: '/retailer/register', action: function (req, res) {
      Root.registerRetailer(function () {
        res.send(JSON.stringify(true));
      })
    }
    },
    {
      path: '/getRetailers', action: function (req, res) {

      Root.retrieveRetailers(function (result) {

        res.send(JSON.stringify({data: result}));
      })


    }
    },
    {
      path: '/insurer/registerAgreement', action: function (req, res) {

      console.log('registerAgreement', req.body);

      Root.registerRetailer(function (response) {
        res.respond(JSON.stringify(response));
      })
    }
    },
  ];

  // setup cors
  app.use(cors());

  routes.forEach(function (item, index) {
    app.get(item.path, item.action);
  });

  app.post('/insurer/registerAgreement', function (req, res) {

    Root.createRetailerAgreement(req.params.address, function (result) {

      var agree = new RetailerAgreement(result);
      agree.setProperties(req.body.retailerName, req.params.address, req.body.commision, req.body.rates, function (resulr) {
        res.send(JSON.stringify({data: true}))
      });

      res.send()
    })
  });

  app.listen(1111, function () {
    console.log('Example app listening on port 3000!')
  });
}

