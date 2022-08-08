pragma solidity >= 0.4.0 < 0.9.0;
contract MappingStructExamples{
    mapping(address=>uint) public balanceReceived;

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceReceived[msg.sender]+=msg.value;
    }
    

    function withdrawMoney(address payable dinesh, uint amount) public{
        require(amount<=balanceReceived[msg.sender],"Insuffient Balance");
        balanceReceived[msg.sender]-=amount;
        dinesh.transfer(amount);
    }

    function withdrawAllMoney(address payable _dinesh) public{
        uint balanceToSend=balanceReceived[msg.sender];
        balanceReceived[msg.sender]=0;
        _dinesh.transfer(balanceToSend);
    }

    
}