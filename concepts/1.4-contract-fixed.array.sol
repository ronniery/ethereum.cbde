// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract FixedSizeArray {
    // Array declaration
    uint[3] public numbers;

    // Array initialization
    uint[3] public sequentialNumbers = [2, 3, 4];

    // Some bytes array
    bytes1 public b1;
    bytes2 public b2;
    bytes3 public b3;
    /* byte public b4; */ // "byte" in older code is a alias for "bytes1" (so forget about "byte", just only "bytes1")

    // Set a new element into array
    function setElement(uint index, uint value) public {
        sequentialNumbers[index] = value;
    }

    // Get the array size
    function getLength() public view returns (uint) {
        return sequentialNumbers.length;
    }

    function setBytesArray() public {
        b1 = 'a';
        b2 = 'ab';
        b3 = 'abc';
        /* b3[0] = 'a' */ // ERROR: You cannot change a single byte from bytearray
    }
}