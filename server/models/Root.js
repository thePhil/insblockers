var fs = require ('fs');
var erisC = require('eris-contracts');
var path = require('path');
var erisdbURL = require('../../package.json').insblockersConf.erisDbUrl;

var contractData = require('../../jobs_output.json');

var moduleName = module.filename.slice(__filename.lastIndexOf(path.sep)+1, module.filename.length -3);

console.log(moduleName);

var ctrAddress = contractData[moduleName];

console.log(ctrAddress)

var ctrABI = JSON.parse(fs.readFileSync(path.join(__dirname,"../../abi/" + ctrAddress)));

var accountData = require("../../accounts.json");
var ctrManager = erisC.newContractManagerDev(erisdbURL, accountData.simplechain_full_000);

var rootCtr = ctrManager.newContractFactory(ctrABI).at(ctrAddress);

function registerInsurer(callback){
	rootCtr.registerInsurer(function (error, result){
		if (error) {
			console.log(error, result);
			throw error
		}
		console.log("Registered Insurer");
		callback();
	});
}

function registerRetailer(callback){
	rootCtr.registerRetailer(function (error, result){
		if (error) {
			console.log(error, result);
			throw error
		}
		console.log("Registered Retailer");
		callback();
	});
}

function registerServiceAgent(callback){
	rootCtr.registerServiceAgent(function (error, result){
		if (error) {
			console.log(error, result);
			throw error
		}
		console.log("Registered Service Agent.");
		callback();
	});
}

module.exports = {
  registerInsurer:registerInsurer,
  registerServiceAgent:registerServiceAgent,
  registerRetailer:registerRetailer,

}
