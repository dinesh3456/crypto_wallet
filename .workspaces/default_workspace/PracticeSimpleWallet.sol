pragma solidity > 0.8.0 <= 0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
import "./PracticeAllowance.sol";
contract sharedWallet is Allowance{
    using SafeMath for uint ;
    event MoneySent(address indexed _benificiary, uint amount);
    event MoneyReceived(address indexed _from, uint amount);
    

    function addAlslowance(address _who, uint amount) public onlyOwner{
        allowance[_who]=amount;
    }

   

        function withdrawMoney( address payable _to, uint amount) public ownerOrAllowed(amount){
            require(amount<=address(this).balance,"Contract does not have enough amount");
            if(!isOwner()){
                reduceAllowance(msg.sender,amount);
            }
            emit MoneySent(_to,amount);
        _to.transfer(amount);
    }

    function renounceOwnership() public override onlyOwner{
        revert(" can't renounceOwnership here");
    }

    receive () external payable{
        emit MoneyReceived(msg.sender,msg.value);

    }
}