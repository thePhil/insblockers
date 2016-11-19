import "ExtendedWarrenty.sol";
import "RetailerAgreement.sol";
import "ServiceAgreement.sol";

contract Root {
    address _insurer;
    mapping(address => bool) _retailers;
    mapping(uint => address) _retailersIndex;
    uint _retailersCount;

    mapping(address => bool) _serviceAgents;
    mapping(uint => address) _serviceAgentsIndex;
    uint _serviceAgentsCount;

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
        _retailersIndex[_retailersCount] = msg.sender;
        _retailersCount++;
    }

    function getRetailerNumber() constant return (uint) {
        return _retailersCount;
    }

    function getRetailer(uint index) constant return (address) {
        return _retailersIndex[index];
    }

    function registerServiceAgent() {
        _serviceAgents[msg.sender] = true;
        _serviceAgentsIndex[_serviceAgentsCount] = msg.sender;
        _serviceAgentsCount++;
    }

    function getServiceAgentNumber() constant return (uint) {
        return _serviceCount;
    }

    function getServiceAgent(uint index) constant return (address) {
        return _serviceIndex[index];
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
