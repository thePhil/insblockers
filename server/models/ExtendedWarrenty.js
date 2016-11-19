var fs = require ('fs');
var erisC = require('eris-contracts');

var erisdbURL = require('../../package.json').insblockersConf.erisDbUrl;
var moduleName = module.filename.slice(__filename.lastIndexOf(path.sep)+1, module.filename.length -3);

console.log(moduleName);


console.log(ctrAddress);


var ctrABI = JSON.parse(fs.readFileSync("../../abi/" + moduleName));

var accountData = require("../../accounts.json");
var ctrManager = erisC.newContractManagerDev(erisdbURL, accountData.simplechain_full_000);


function ExtendedWarrenty(address){
	this._address = address;
	this._factory = null;
	this._ctrManager = null;
	this.resolve();
}


ExtendedWarrenty.prototype.resolve = function resolve(){
	this._factory = ctrManager.newContractFactory(ctrABI).at(_address);

}

function callBackHelper(error, result, callback) {
	if(error) {
		console.log(error, result);
		throw error;
	}

	console.log(result);
	callback(result);
}

ExtendedWarrenty.prototype.getCustomerName = function (callback){
	this._factory.getCustomerName(function (error, result){
		callBackHelper(error, result, callback);
	});
};


ExtendedWarrenty.prototype.getCustomerEmail = function (callback){
	this._factory.getCustomerEmail(function (error, result){
		callBackHelper(error, result, callback);
	});
};

ExtendedWarrenty.prototype.getRepairRate = function (callback){
	this._factory.getRepairRate(function (error, result){
		callBackHelper(error, result, callback);
	});
};

ExtendedWarrenty.prototype.getSerialNumber = function (callback){
	this._factory.getSerialNumber(function (error, result){
		callBackHelper(error, result, callback);
	});
};

ExtendedWarrenty.prototype.getDateOfSale = function (callback){
	this._factory.getDateOfSale(function (error, result){
		callBackHelper(error, result, callback);
	});
};

ExtendedWarrenty.prototype.getDateOfExtendedWarrentyEnd = function (callback){
	this._factory.getDateOfExtendedWarrentyEnd(function (error, result){
		callBackHelper(error, result, callback);
	});
};

ExtendedWarrenty.prototype.getManufacturer = function (callback){
	this._factory.getManufacturer(function (error, result){
		callBackHelper(error, result, callback);
	});
};

ExtendedWarrenty.prototype.getProduct = function (callback){
	this._factory.getProduct(function (error, result){
		callBackHelper(error, result, callback);
	});
};

ExtendedWarrenty.prototype.getPremium = function (callback){
	this._factory.getPremium(function (error, result){
		callBackHelper(error, result, callback);
	});
};

ExtendedWarrenty.prototype.reportFault = function (callback){
	this._factory.reportFault(function (error){
		if(error) {
			console.log(error, result);
			throw error;
		}

		console.log("Fault reported");
		callback();
	});
};
