// SPDX-License-Identifier: GPL-3.0

// pragma solidity >=0.5.0 <0.9.0;
pragma solidity 0.8.0;

contract Property {
    // Boolean Type
    bool public sold; // true | false

    // Integer Type
    /*uint8 public x = 256;*/ // ERROR: overflow for uint8
    uint8 public x = 255;
    int8 public y = -10;

    // Overflow and underflow
    function f1() public {
        // The "unchecked" keyword, tells to compiler to not use arithmetic verification on the given code, 🤔 probably we don't want that!
        unchecked { x += 1; }
    }
}