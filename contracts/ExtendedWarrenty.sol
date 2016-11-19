import "RetailerAgreement.sol";

contract ExtendedWarrenty {
    address _retailer = msg.sender;
    RetailerAgreement _retailerAgreement;
    address _serviceAgent;
    string _customerName;
    string _customerEmail;
    string _serialNumber;

    //*
    // Not to be stored in BC in end solution
    uint _dateOfSale;
    uint _dateOfExtendedWarrentyEnd;
    string _manufacturer;
    string _product;
    uint _premium;
    //*

    bool _defect;

    event created();
    event toBeRepaired();
    event toBeReplaced();

    modifier onlyRetailer() {
        if (msg.sender != _retailer)
            throw;
        _;
    }

    modifier onlyServiceAgent() {
        if (msg.sender != _serviceAgent)
            throw;
        _;
    }

    function ExtendedWarrenty(address retailer,
                              RetailerAgreement retailerAgreement) {
        _retailer = retailer;
        _retailerAgreement = retailerAgreement;
    }

    function setProperties(string customerName,
                           string customerEmail,
                           uint dateOfSale,
                           uint dateOfExtendedWarrentyEnd,
                           string manufacturer,
                           string product,
                           uint premium) {
        _customerName = customerName;
        _customerEmail = customerEmail;
        _dateOfSale = dateOfSale;
        _dateOfExtendedWarrentyEnd = dateOfExtendedWarrentyEnd;
        _manufacturer = manufacturer;
        _product = product;
        _premium = premium;
    }

    function getRetailer() constant returns(address) {
        return _retailer;
    }

    function getRetailerAgreement() constant returns(RetailerAgreement) {
        return _retailerAgreement;
    }

    function getCustomerName() constant returns(string) {
        return _customerName;
    }

    function getCustomerEmail() constant returns(string) {
        return _customerEmail;
    }

    function getSerialNumber() constant returns(string) {
        return _serialNumber;
    }

    function getDateOfSale() constant returns(uint) {
        return _dateOfSale;
    }

    function getDateOfExtendedWarrentyEnd() constant returns(uint) {
        return _dateOfExtendedWarrentyEnd;
    }

    function getManufacturer() constant returns(string) {
        return _manufacturer;
    }

    function getSProduct() constant returns(string) {
        return _product;
    }

    function getPremium() constant returns(uint) {
        return _premium;
    }

    function reportFault() {
        if (_dateOfExtendedWarrentyEnd < now)
            throw;

        _defect = true;
 
        // TODO: rules to decide whether repair or replace
        if (1==1) {
            startReplaceProduct();
        } else {
            startRepairProduct();
        }
    }

    function startRepairProduct() {
        // TODO: find service agent
        _serviceAgent = _serviceAgent;
        toBeRepaired();
    }

    function startReplaceProduct() {
        toBeReplaced();
    }

    function reportReportRepaired(int invoice) onlyServiceAgent {
        _defect = false;
        // TODO: raise invoice
    }

    function reportReportRepaired(int invoice, string serialNumber) onlyRetailer {
        _defect = false;
        _serialNumber = serialNumber;
        // TODO: raise invoice
    }

    function notifyCustomer() constant {
        created();
    }
}
