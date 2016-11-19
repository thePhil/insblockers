import "ExtendedWarrenty.sol";
import "RetailerAgreement.sol";
import "ServiceAgreement.sol";

contract Root {
    address _insurer;
    mapping(address => bool) _retailers;
    mapping(address => bool) _serviceAgents;

    ExtendedWarrenty[] _extendedWarrenties;
    RetailerAgreement[] _retailerAgreements;
    ServiceAgreement[] _serviceAgreements;

    modifier onlyInsurer() {
        if (msg.sender != _insurer)
            throw;
        _;
    }

    modifier onlyRetailer() {
        if (!_retailers[msg.sender])
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

    function createRetailerAgreement(address retailer) onlyInsurer returns (RetailerAgreement) {
        if (!_retailers[retailer])
            throw;

        RetailerAgreement retailerAgreement = new RetailerAgreement(msg.sender, retailer);
        _retailerAgreements.push(retailerAgreement);
        retailerAgreement.notifyRetailer();

        return retailerAgreement;
    }

    function createServiceAgreement(address serviceAgent) onlyInsurer returns (ServiceAgreement) {
        if (!_serviceAgents[serviceAgent])
            throw;

        ServiceAgreement serviceAgreement = new ServiceAgreement(msg.sender, serviceAgent);
        _serviceAgreements.push(serviceAgreement);
        serviceAgreement.notifyServiceAgent();

        return serviceAgreement;
    }

    function createExtendedWarrenty(RetailerAgreement retailerAgreement) onlyRetailer returns (ExtendedWarrenty) {
        if (msg.sender != retailerAgreement.getRetailer())
            throw;

        ExtendedWarrenty extendedWarrenty = new ExtendedWarrenty(msg.sender, retailerAgreement);
        _extendedWarrenties.push(extendedWarrenty);
        extendedWarrenty.notifyCustomer();
    }

    function getHello() constant returns (uint a) {
	    a = 5;
    }

}
