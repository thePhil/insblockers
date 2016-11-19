contract ServiceAgreement {
    address _insurer;
    address _serviceAgent;
    
    bool _confirmed;
    
    string _serviceAgentName;
    string _serviceAgentAddress;
    uint _repairRate;
    uint _serviceLevel;
    
    event created();
    
    modifier onlyServiceAgent() {
        if (msg.sender != _serviceAgent)
            throw;
        _;
    }

    function ServiceAgreement(address insurer,
                              address serviceAgent) {
        _insurer = insurer;
        _serviceAgent = serviceAgent;
    }

    function setProperties(string serviceAgentName,
                           string serviceAgentAddress,
                           uint repairRate,
                           uint serviceLevel) {
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
    
    function getRepairRate() constant returns(uint) {
        return _repairRate;
    }

    function getServiceLevel() constant returns(uint) {
        return _serviceLevel;
    }

    function confirm() onlyServiceAgent {
        _confirmed = true;
    }

    function getConfirmed() constant returns(bool) {
        return _confirmed;
    }

    function notifyServiceAgent() constant {
        created();
    }
}
