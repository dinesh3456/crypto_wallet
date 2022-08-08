pragma solidity > 0.4.0 <= 0.9.0 ;

contract practice{
    uint balanceReceived;
    
    function balanceReceived() public payable{
        balanceReceived+=msg.value;

    }

    function getBalance() public view returns(uint){
        return address(this).balance;

    }
}
