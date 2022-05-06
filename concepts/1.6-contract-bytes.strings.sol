// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

// Fixed arrays cost less gas then dynamic arrays
contract BytesAndStrings {
    /** Those two are reference types, not of value types */
    bytes public b1 = "abc";
    string public s1 = "abc";

    function addElement() public {
        // You can add new elements on a array of bytes
        b1.push('x');
        // You can't add elements on a string
        // s1.push('x'); ERROR: member "push" is not visible for string
    }

    function getElementAt(uint idx) public view returns (bytes1) {
        return b1[idx];
        // return s1[idx]; ERROR: Index access for a string is not possible
    }

    function getLength() public view returns (uint) {
        return b1.length;
        // return s1.length; ERROR: Member "length" is not found for "string"
    }
}