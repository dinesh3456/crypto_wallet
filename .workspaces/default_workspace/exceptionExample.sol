pragma solidity >=0.8.0 <0.9.0;
contract ExceptionExample{

    mapping(address=>uint) public balanceReceived;
    address payable public owner;

    constructor()  {
        owner=payable(msg.sender);
    }

    function getOwner() public view returns(address){
        return owner;
    }

    function convertWEiToEther(uint amount) public pure returns(uint){
        return amount/1 ether;
    }

    function destroySmartContract() public{
        require(msg.sender== owner,"You are not the owner");
        selfdestruct(owner);
    }

    function receiveMoney() public payable{
        assert(balanceReceived[msg.sender]+msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender]+=uint(msg.value);

    }

    function withdrawMoney(address payable dinesh, uint amount ) public{
        require(balanceReceived[msg.sender]>=amount,"Insuffient Ether");
        assert(balanceReceived[msg.sender]>=balanceReceived[msg.sender]-amount);
        balanceReceived[msg.sender]-=amount;
        dinesh.transfer(amount);
    }

     receive() external  payable  {
        receiveMoney();
    }
}