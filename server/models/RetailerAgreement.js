var fs = require ('fs');
var erisC = require('eris-contracts');

var erisdbURL = require('../../package.json').insblockersConf.erisDbUrl;
var moduleName = module.filename.slice(__filename.lastIndexOf(path.sep)+1, module.filename.length -3);

console.log(moduleName);


console.log(ctrAddress);


var ctrABI = JSON.parse(fs.readFileSync("../../abi/" + moduleName));

var accountData = require("../../accounts.json");
var ctrManager = erisC.newContractManagerDev(erisdbURL, accountData.simplechain_full_000);


function RetailerAgreement(address){
	this._address = address;
	this._factory = null;
	this._ctrManager = null;
	this.resolve();
}


RetailerAgreement.prototype.resolve = function resolve(){
	this._factory = ctrManager.newContractFactory(ctrABI).at(_address);

}

RetailerAgreement.prototype.getRetailerName = function (callback){
	this._factory.getRetailerName(function (error, result){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log(result);
		callback(result);
	});	

};


RetailerAgreement.prototype.getRetailerAddress = function (callback){
	this._factory.getRetailerAddress(function (error, result){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log(result);
		callback(result);
	});	

};

RetailerAgreement.prototype.getCommisionRate = function (callback){
	this._factory.getCommisionRate(function (error, result){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log(result);
		callback(result);
	});	

};

RetailerAgreement.prototype.getInsuranceRate = function (callback){
	this._factory.getInsuranceRate(function (error, result){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log(result);
		callback(result);
	});	

};

RetailerAgreement.prototype.confirm = function (callback){
	this._factory.confirm(function (error){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log("Retail Agreement confirmed");
		callback();
	});	
};


RetailerAgreement.prototype.notifyRetailer = function (callback){
	this._factory.notifyRetailer(function (error){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log("Retailer notified.");
		callback();
	});	
};

RetailerAgreement.prototype.setProperties = function (retailerName, retailerAdress
	, commisionRate, insuranceRate, callback){
		this._factory.setProperties(retailerName, retailerAdress
			, commisionRate, insuranceRate, function(error, result){
			
				if(error) {
					throw error;
				}

				console.log("Properties  set: " + result);
				callback();
			});
};	
