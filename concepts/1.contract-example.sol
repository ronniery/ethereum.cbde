// SPDX-License-Identifier: GPL-3.0

// pragma solidity 0.8.0;
pragma solidity >=0.5.0 <0.9.0;

contract Property {
    uint private price;
    address public owner;

    // Comment inspirated from C++, this is the constructor
    constructor () {
        price = 0;
        owner = msg.sender;
    }

    // Function modifiers
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // Setter functions, they change blockchain state variable it costs gas
    function changeOnwer(address _owner) public onlyOwner {
        owner = _owner;
    }

    /**
     * Comment inspired from JavaScript, that function set contract's price
     */
    function setPrice(uint _price) public {
        price = _price;
    }

    /// @notice Returns the price of the Property
    function getPrice() view public returns (uint) {
        return price;
    }

    // Events
    event OwnerChanged(address owner);
}