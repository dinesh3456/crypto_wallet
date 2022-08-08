pragma solidity >=0.8.0 < 0.9.0;
contract EventExample{
    mapping (address=>uint) public tokenBalance;
    event TokenSent( address _from, address dinesh, uint amount);

    constructor(){
        tokenBalance[msg.sender]=100;
    }
    function sendToken(address payable dinesh,uint amount) public returns(bool){
        require(tokenBalance[msg.sender]>=amount,"Insuffient Balance");
        assert(tokenBalance[dinesh]+amount>=tokenBalance[dinesh]);
        assert(tokenBalance[msg.sender]-amount<=tokenBalance[msg.sender]);
        tokenBalance[msg.sender]-=amount;
        tokenBalance[dinesh]+=amount;

        emit TokenSent(msg.sender,dinesh,amount);
        
        return true;
    }
}