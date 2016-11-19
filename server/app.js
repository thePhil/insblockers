// requires
var fs = require ('fs');
var path = require('path');
var erisC = require('eris-contracts');
var Server = require('./server');



// NOTE. On Windows/OSX do not use localhost. find the
// url of your chain with:
// docker-machine ls
// and find the docker machine name you are using (usually default or eris).
// for example, if the URL returned by docker-machine is tcp://192.168.99.100:2376
// then your erisdbURL should be http://192.168.99.100:1337/rpc

// get the abi and deployed data squared away
// start server
Server();
