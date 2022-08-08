pragma solidity >= 0.4.0 < 0.9.0;

contract MappingUsingStruct{

    mapping(address => uint) public balanceReceived;

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function sendmoney() public payable{
        balanceReceived[msg.sender]+=msg.value;

    }

    function withdrawAllMoney(address payable _to) public{
        uint balaceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender]=0;
        _to.transfer(balaceToSend);
    }
}