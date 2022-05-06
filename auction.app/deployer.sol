//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;

contract A {
    address public owner;

    // Here we can use the given address to set the contract's owner
    constructor(address eoa) {
        owner = eoa;
    }
}

contract Creator {
    address public ownerCreator;
    A[] public deployedA;

    constructor() {
        ownerCreator = msg.sender;
    }

    function deployA() public { 
        // It will send a address inside the msg.sender that can be used to replace the "A" onwer.
        A contractAddress = new A(msg.sender);
        deployedA.push(contractAddress);
    }
}