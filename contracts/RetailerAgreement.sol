contract RetailerAgreement {
    address _insurer;
    address _retailer;
    
    bool _confirmed;
    
    string _retailerName;
    string _retailerAddress;
    uint _commisionRate;
    uint _insurenceRate;
    
    event created();
    
    modifier onlyRetailer() {
        if (msg.sender != _retailer)
            throw;
        _
    }
    }

    function RetailerAgreement(address insurer,
                               address retailer) {
        _insurer = insurer;
        _retailer = retailer;
    }

    function setProperties(string retailerName,
                           string retailerAddress,
                           uint commisionRate,
                           uint insurenceRate) {
        _retailerName = retailerName;
        _retailerAddress = retailerAddress;
        _commisionRate = commisionRate;
        _insurenceRate = insurenceRate;
    }

    function getRetailer() constant returns(address) {
        return _retailer;
    }
    
    function getRetailerName() constant returns(string) {
        return _retailerName;
    }
    
    function getRetailerAddress() constant returns(string) {
        return _retailerAddress;
    }
    
    function getCommisionRate() constant returns(uint) {
        return _commisionRate;
    }

    function getInsuranceRate() constant returns(uint) {
        return _insurenceRate;
    }

    function confirm() onlyRetailer {
        _confirmed = true;
    }
    
    function getConfirmed() constant returns(bool) {
        return _confirmed;
    }

    function notifyRetailer() constant {
        created();
    }
}
