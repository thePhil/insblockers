import "ExtendedWarrenty.sol";
import "RetailerAgreement.sol";
import "ServiceAgreement.sol";

contract Root {
    address _insurer;
    mapping(address => bool) _retailers;
    address[] _retailersArray;

    mapping(address => bool) _serviceAgents;
    address[] _serviceAgentsArray;

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
        if (!_retailers[msg.sender]) {
            _retailers[msg.sender] = true;
            _retailersArray.push(msg.sender);
        }
    }

    function getRetailers() constant returns (address[]) {
        return _retailersArray;
    }

    function registerServiceAgent() {
        if (!_serviceAgents[msg.sender]) {
            _serviceAgents[msg.sender] = true;
            _serviceAgentsArray.push(msg.sender);
        }
    }

    function getServiceAgents() constant returns (address[]) {
        return _serviceAgentsArray;
    }

    function createRetailerAgreement(address retailer) onlyInsurer returns (RetailerAgreement) {
        if (!_retailers[retailer])
            throw;

        RetailerAgreement retailerAgreement = new RetailerAgreement(msg.sender, retailer);
        _retailerAgreements.push(retailerAgreement);
        retailerAgreement.notifyRetailer();

        return retailerAgreement;
    }

    function getRetailerAgreements() constant returns (RetailerAgreement[]) {
        return _retailerAgreements;
    }

    function createServiceAgreement(address serviceAgent) onlyInsurer returns (ServiceAgreement) {
        if (!_serviceAgents[serviceAgent])
            throw;

        ServiceAgreement serviceAgreement = new ServiceAgreement(msg.sender, serviceAgent);
        _serviceAgreements.push(serviceAgreement);
        serviceAgreement.notifyServiceAgent();

        return serviceAgreement;
    }

    function getServiceAgreements() constant returns (ServiceAgreement[]) {
        return _serviceAgreements;
    }

    function createExtendedWarrenty(RetailerAgreement retailerAgreement) onlyRetailer returns (ExtendedWarrenty) {
        if (msg.sender != retailerAgreement.getRetailer())
            throw;

        ExtendedWarrenty extendedWarrenty = new ExtendedWarrenty(msg.sender, retailerAgreement);
        _extendedWarrenties.push(extendedWarrenty);
        extendedWarrenty.notifyCustomer();
    }

    function getExtendedWarrenties() constant returns (ExtendedWarrenty[]) {
        return _extendedWarrenties;
    }

    function getHello() constant returns (uint a) {
	    a = 5;
    }

}
