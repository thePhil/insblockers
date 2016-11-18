pragma solidity ^0.4.4;

contract ServiceAgreement {
    address _insurer = msg.sender;
    address _serviceAgent;
    
    bool _confirmed;
    
    string _serviceAgentName;
    string _serviceAgentAddress;
    int8 _repairRate;
    int8 _serviceLevel;
    
    event created();
    
    modifier onlyServiceAgent() {
        if (msg.sender != _serviceAgent)
            throw;
        _;
    }

    function ServiceAgreement(address serviceAgent,
                              string serviceAgentName,
                              string serviceAgentAddress,
                              int8 repairRate,
                              int8 serviceLevel) {
        _serviceAgent = serviceAgent;
        _serviceAgentName = serviceAgentName;
        _serviceAgentAddress = serviceAgentAddress;
        _repairRate = repairRate;
        _serviceLevel = serviceLevel;
    }

    function getServiceAgent() constant returns(address) {
        return _serviceAgent;
    }
    
    function getServiceAgentName() constant returns(string) {
        return _serviceAgentName;
    }
    
    function getServiceAgentAddress() constant returns(string) {
        return _serviceAgentAddress;
    }
    
    function getRepairRate() constant returns(int8) {
        return _repairRate;
    }

    function getServiceLevel() constant returns(int8) {
        return _serviceLevel;
    }

    function confirm() onlyServiceAgent {
        _confirmed = true;
    }
    
    function notifyServiceAgent() {
        created();
    }
}
