// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Property {
    // State variable
    int public price;
    string public location = "London";
    address public owner;
    // ERROR: all constants must have a value, before contract creation;
    int constant area;
    // "immutable" are variables that can be defined when contract is created, only once;
    int immutable latitude;

    constructor(int _price, string memory _location) {
        price = _price;
        location = _location;
        // That variable "msg" exists on global scope
        owner = msg.sender;
    }

    /**
     * To create a function, you must have...
     *
     * [function] <name>(params) <visibility> <value return?>
     */
    function setPrice(int _price) public {
        // It changes the blockchain state and generates a transaction, so it costs gas!
        price = _price;
    }

    // If a function is read-only, it have to be marked as "pure" or "view".
    function getPrice() public view returns (int) {
        // It doesn't change anything, so it's free.
        return price;
    }

    /**
     * The "memory" is required because the explicit data alocation for all variables
     * of type array, string, struct or mapping is mandatory, to indicates the variable will
     * be saved on memory, not in the storage (which costs gas)
     */ 
    function setLocation(string memory _location) public {
        location = _location;
    }
}