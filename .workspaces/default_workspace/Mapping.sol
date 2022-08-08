pragma solidity >= 0.4.0  < 0.9.0;

contract SimpleMappingExample{
    bool myvar1 = false;
    bool myvar2 = false;
    bool myvar3 = false;



    mapping(uint  => bool) public dinesh;
    mapping(address => bool) public myAddressMapping;

    function setValue(uint _index) public{
        dinesh[_index] = true;
    }

    function setMyvar1ToTrue() public{
        myvar1 = true;
    }


    function setMyAddressToTrue() public{
        myAddressMapping[msg.sender] = true;
    }
}