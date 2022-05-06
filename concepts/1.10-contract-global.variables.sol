// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

/**
 * #global msg {
 *  sender: it is the addres that is currently interacting with the contract calling a function/deploying it.
 *  value: it is the value in eth sent to the contract for functions marked as "payable"
 *  data: the data field related to the transaction executed this function
 * }
 *
 * #global block {
 *   timestamp: return the current Unix epoch
 *   number: return the current block number
 *   difficulty: return the blockchain minning difficulty
 *   gaslimit: returns the gaslimit for that block
 * }
 */
contract GlobalVariables {
    address public owner;
    uint public sentValue;

    // Some block global variables
    uint public this_moment = block.timestamp; // this is deprecated
    uint public block_number = block.number;
    uint public difficulty = block.difficulty;
    uint public gaslimit = block.gaslimit;

    constructor() {
        owner = msg.sender;
    }

    // Call it and see the owner changing
    function changeOwner() public {
        owner = msg.sender;
    }

    function sendEther() payable public {
        sentValue = msg.value;
    }

    // You're able to see the balance sent
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function howMuchGas() public view returns (uint) {
        uint start = gasleft();
        uint j = 0;

        for(uint i=1; i < 20; i++) {
            j *= i;
        }

        uint end = gasleft();
        return start - end;
    }
}