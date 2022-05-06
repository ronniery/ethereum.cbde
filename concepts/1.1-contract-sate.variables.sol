// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

/**
 * Variables can be saved on 3 different places:
 * 
 *    Storage:
 *      - Holds state variables; - Persistent and expensive (it cost gas)  
 *    Stack:
 *      - Holds local variables defined inside functions if they are not referencing types (ex: int); - Free to be used (no gas)
 *    Memory:
 *      - Holds local variables defined functions if they are referencing types but declared with "memory" keyword;
 *      - Holds function arguments; - Like a computer RAM; - Free to be used (no gas)
 *
 *    Reference Types: string, array, struct and mapping. 
 */

contract Property {
    // It is a state variable, it costs to be changed
    int public price;
    string constant public location = "London";

    // price = 100; this is not permitted in Solidity

    function f() public pure returns (int) {
        int x = 5;
        x = x * 2;
        return x;
    }

    function g() public {
        string s1 = "abc";
        // It tells to compiler to not holds the variable value into state (state = gas)
        string memory s2 = "abc";
    }
}