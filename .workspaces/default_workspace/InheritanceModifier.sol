pragma solidity >=0.8.0 < 0.9.0;
import "./Owned.sol";

contract InheritanceModifierExample is Owned{
    mapping(address=>uint) public tokenBalance;

    
    uint tokenPrize=1 ether;
    constructor(){
        tokenBalance[owner]=100;
    }

    function createToken() public{
        tokenBalance[owner]++;
    }

    function purchaseToken() public payable{
        tokenBalance[owner]-=msg.value/tokenPrize;
        tokenBalance[msg.sender]+=msg.value/tokenPrize;
    }

    function burnToken() public{
        tokenBalance[owner]--;
    }

    function sendToken(address payable dinesh,uint amount) public{
        require(tokenBalance[owner]>=amount,"Insuffient token");
        assert(tokenBalance[dinesh]+amount>=tokenBalance[dinesh]);
        assert(tokenBalance[owner]-amount<=tokenBalance[owner]);
        tokenBalance[owner]-=amount;
        tokenBalance[dinesh]+=amount;
    }
}