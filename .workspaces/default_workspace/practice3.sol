pragma solidity >= 0.7.0 < 0.9.0;
contract Examples{
    struct Payment{
        uint amount;
        uint timestamp;
    }
    struct Balance{
        uint totalBalance;
        uint numPayments;
        mapping(uint=>Payment) payments;
    }
    mapping(address=>Balance) public balanceReceived;

    function sendmoney() public payable{
        balanceReceived[msg.sender].totalBalance=msg.value;

        Payment memory payment=Payment(msg.value,block.timestamp);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments]=payment;
        balanceReceived[msg.sender].numPayments++;

    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawMoney(address payable dinesh,uint amount) public{
        require(amount<=balanceReceived[msg.sender].totalBalance,"Insuffient Balacnce");
        balanceReceived[msg.sender].totalBalance-=amount;
        dinesh.transfer(amount);
    }

    function withdrawAllMoney( address payable dong) public{
        dong.transfer(address(this).balance);    } 
   
}