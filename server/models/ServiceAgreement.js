var fs = require ('fs');
var erisC = require('eris-contracts');

var erisdbURL = require('../../package.json').insblockersConf.erisDbUrl;
var moduleName = module.filename.slice(__filename.lastIndexOf(path.sep)+1, module.filename.length -3);

console.log(moduleName);


console.log(ctrAddress);


var ctrABI = JSON.parse(fs.readFileSync("../../abi/" + moduleName));

var accountData = require("../../accounts.json");
var ctrManager = erisC.newContractManagerDev(erisdbURL, accountData.simplechain_full_000);


function ServiceAgreement(address){
	this._address = address;
	this._factory = null;
	this._ctrManager = null;
	this.resolve();
}


ServiceAgreement.prototype.resolve = function resolve(){
	this._factory = ctrManager.newContractFactory(ctrABI).at(_address);

}

ServiceAgreement.prototype.getServiceAgentName = function (callback){
	this._factory.getServiceAgentName(function (error, result){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log(result);
		callback(result);
	});
};


ServiceAgreement.prototype.getServiceAgentAddress = function (callback){
	this._factory.getServiceAgentAddress(function (error, result){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log(result);
		callback(result);
	});
};

ServiceAgreement.prototype.getRepairRate = function (callback){
	this._factory.getRepairRate(function (error, result){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log(result);
		callback(result);
	});
};

ServiceAgreement.prototype.getServiceLevel = function (callback){
	this._factory.getServiceLevel(function (error, result){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log(result);
		callback(result);
	});
};

ServiceAgreement.prototype.confirm = function (callback){
	this._factory.confirm(function (error){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log("Retail Agreement confirmed");
		callback();
	});
};

ServiceAgreement.prototype.getConfirmed = function (callback){
	this._factory.getConfirmed(function (error, result){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log(result);
		callback(result);
	});
};

ServiceAgreement.prototype.setProperties = function (serviceAgentName, serviceAgentAddress, repairRate, serviceLevel, callback){
	this._factory.setProperties(serviceAgentName, serviceAgentAddress, repairRate, serviceLevel, function(error, result){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log("Properties  set: " + result);
		callback();
	});
};
