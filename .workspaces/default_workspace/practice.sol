pragma solidity >= 0.4.0 < 0.9.0;
 contract practice{
     mapping(address => uint) public balanceReceived;

     function getBalance() public view returns(uint){
         return address(this).balance;
     }

     function sendmoney() public payable{
         balanceReceived[msg.sender]+=msg.value;
                
     } 

     function withdrawMoney (address payable _dinesh, uint amount) public{
         require (amount<=balanceReceived[msg.sender],"not enough money");
         balanceReceived[msg.sender]-=amount;        
         _dinesh.transfer(amount);
     }

     function withdrawAllMoney(address payable dinesh) public{
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender]=0;
        dinesh.transfer(balanceToSend);

     }

 }