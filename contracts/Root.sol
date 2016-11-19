pragma solidity ^0.4.4;

import "RetailerAgreement.sol";
import "ServiceAgreement.sol";

contract Root {
    address _insurer;
    mapping(address => bool) _retailers;
    mapping(address => bool) _serviceAgents;
    
    RetailerAgreement[] _retailerAgreements;
    ServiceAgreement[] _serviceAgreements;
    
    
    modifier onlyInsurer() {
        if (msg.sender != _insurer)
            throw;
        _;
    }
    
    function registerInsurer() {
        _insurer = msg.sender;
    }
    
    function registerRetailer() {
        _retailers[msg.sender] = true;
    }
    
    function registerServiceAgent() {
        _serviceAgents[msg.sender] = true;
    }
    
    function createRetailerAgreement(RetailerAgreement retailerAgreement) onlyInsurer {
        address retailer = retailerAgreement.getRetailer();
        if (!_retailers[retailer])
            throw;

        _retailerAgreements.push(retailerAgreement);
        retailerAgreement.notifyRetailer();
    }

    function createServiceAgreement(ServiceAgreement serviceAgreement) onlyInsurer {
        address serviceAgent = serviceAgreement.getServiceAgent();
        if (!_serviceAgents[serviceAgent])
            throw;

        _serviceAgreements.push(serviceAgreement);
        serviceAgreement.notifyServiceAgent();
    }
    
}
