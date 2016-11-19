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
        _
        ;
    }

    modifier onlyRetailer() {
        if (!_retailers[msg.sender])
            throw;
        _
        ;
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

    function createServiceAgreement(ServiceAgreement serviceAgreement) onlyInsurer {
        address serviceAgent = serviceAgreement.getServiceAgent();
        if (!_serviceAgents[serviceAgent])
            throw;

        _serviceAgreements.push(serviceAgreement);
        serviceAgreement.notifyServiceAgent();
    }

    function createExtendedWarrenty(ExtendedWarrenty extendeWarrenty) onlyRetailer {
        extendeWarrenty.notifyCustomer();
    }

    function getHello() constant returns (uint a) {
	    a = 5;
    }

}
