pragma solidity >=0.8.0 < 0.9.0;

import "./Allowance.sol";
contract SimpleWallet is Allowance {

    event MoneySent( address indexed beneficiary,uint amount);
    event MoneyReceived(address indexed _from ,uint amount);
    
  
    function withdrawMoney(address payable _to, uint amount)public ownerOrAllowed(amount){
        require(amount <= address(this).balance, "There are not enough funds stored in the smart contract");
        if(msg.sender!=owner()){
            reduceAllowance(msg.sender,amount);
        }            
        
        _to.transfer(amount);
    }
    
    function renounceOwnership() public override onlyOwner{
        revert("can't renounce the ownership here");
    }

    receive() external payable{
        emit MoneyReceived(msg.sender,msg.value);
    }
}