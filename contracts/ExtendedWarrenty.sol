import "ServiceAgreement.sol";

contract ExtendedWarrenty {
    address _retailer = msg.sender;
    ServiceAgreement _serviceAgreement;
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
    
    event created();
    
    function ExtendedWarrenty(ServiceAgreement serviceAgreement,
                              string customerName,
                              string customerEmail,
                              uint dateOfSale,
                              uint dateOfExtendedWarrentyEnd,
                              string manufacturer,
                              string product,
                              uint premium) {
        _serviceAgreement = serviceAgreement;
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
    
    function getServiceAgreement() constant returns(ServiceAgreement) {
        return _serviceAgreement;
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

    function notifyCustomer() {
        created();
    }
}
