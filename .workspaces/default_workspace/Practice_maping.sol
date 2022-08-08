pragma solidity >= 0.4.0 < 0.9.0;
contract PracticeMapping{
    
    mapping(uint => bool) public uintMapping;
    mapping(address => bool) public addressMapping;

    function setValue(uint _index) public{
        uintMapping[_index] = true;
    }

    function setMyAddressToTrue() public{
        addressMapping[msg.sender]=true;
    }


}