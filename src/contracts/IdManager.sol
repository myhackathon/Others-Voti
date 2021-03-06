pragma solidity ^0.4.18;

import "./Ownable.sol";

contract IdManager is Ownable {

    struct ID {
        bool exists;
        bytes32 name;
        bytes32 region;
    }

    mapping(address => ID) public idMap;

    function IdManager() public {}

    function registerId(address _address, bytes32 _name, bytes32 _region) public onlyOwner {
        require(!idMap[_address].exists);
        ID storage theId = idMap[_address];
        theId.exists = true;
        theId.name = _name;
        theId.region = _region;
    }

    function removeId(address _address) public onlyOwner {
        delete idMap[_address];
    }

    function isValidId() public view returns (bool) {
        return idMap[msg.sender].exists;
    }
}