// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract A {
    string[] public cities = ['Prague', 'Bucharest'];

    // It doesn't change the state of the variable
    function f_memory() public view {
        string[] memory s1 = cities;
        // string s2; ERROR: You have to specify the data allocation for strings;

        // So when someone wants to see cities[0], it will still be "Prague"
        s1[0] = 'Berlin';
    }

    // And here it does change the state of the blockchain (it costs gas!)
    function f_storage() public {
        string[] storage s1 = cities;
        // cities[0] will also be "Berlin"
        s1[0] = 'Berlin';
    }
}