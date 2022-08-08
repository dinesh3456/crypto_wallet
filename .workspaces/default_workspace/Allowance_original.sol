pragma solidity > 0.8.0 <= 0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract Allowance is Ownable{
    using SafeMath for uint ;

    event AllowanceChanged(address indexed _forwho, address indexed _towhom, uint oldAmount, uint newAmount);
    mapping(address => uint) public allowance;

  function isOwner() virtual internal view returns(bool){
        return owner()==msg.sender;
    }

    

    function setAllowance(address _who ,uint amount) public onlyOwner{
        emit AllowanceChanged(_who,msg.sender,allowance[_who],amount);
        allowance[_who]=amount;
    }

    modifier ownerOrAllowed (uint amount){
        require (isOwner() || allowance[msg.sender]>=amount,"You are not allowed, you don't have enough token");
        _;
    }

    function reduceAllowance(address _who,uint amount) internal ownerOrAllowed(amount) {
        emit AllowanceChanged(_who,msg.sender,allowance[_who],allowance[_who].sub(amount));
        allowance[_who]=allowance[_who].sub(amount);
    }

   


    


}
