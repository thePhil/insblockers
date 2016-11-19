contract RetailerAgreement {
    address _insurer = msg.sender;
    address _retailer;
    
    bool _confirmed;
    
    string _retailerName;
    string _retailerAddress;
    int8 _commisionRate;
    int8 _insurenceRate;
    
    event created();
    
    modifier onlyRetailer() {
        if (msg.sender != _retailer)
            throw;
        _;
    }

    function RetailerAgreement(address retailer,
                               string retailerName,
                               string retailerAddress,
                               int8 commisionRate,
                               int8 insurenceRate) {
        _retailer = retailer;
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
    
    function getCommisionRate() constant returns(int8) {
        return _commisionRate;
    }

    function getInsuranceRate() constant returns(int8) {
        return _insurenceRate;
    }

    function confirm() onlyRetailer {
        _confirmed = true;
    }
    
    function notifyRetailer() {
        created();
    }
}
