pragma solidity >= 0.4.0 < 0.9.0;
contract StrcuturePractice{

    struct Payment{
        uint amount;
        uint timestamps;

    }

    struct Balance{
        uint totalBalance;
        uint numPayments;
        mapping(uint=>Payment) payments;
    }
    
    mapping(address=>uint) public balanceReceived;

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function sendmoney() public payable{
        balanceReceived[msg.sender].totalBalance+= msg.value;
        Payment memory payment=Payment(msg.value,now);
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments]=payment;
        balanceReceived[msg.sender].numPayments++;
    }

    function withdrawMoney(address payable _to,uint amount) public {
        require(balanceReceived[msg.sender].totalBalance>=amount,"not enough balance");
        balanceReceived[msg.sender].totalBalance-=amount;
        _to.transfer(amount);
    }

    function withdrawAllMoney(address payable _to) public{
        uint balaceToSend=balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender]=0;
        _to.transfer(balaceToSend);
    }
    } 

