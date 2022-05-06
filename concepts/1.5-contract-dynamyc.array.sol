// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract DynamicArrays {
    /**
     * Arrays contain 3 main functions
     *   .length
     *   .push
     *   .pop
     */
    uint[] public numbers;

    // It returns the array's size
    function getLength() public view returns (uint) {
        return numbers.length;
    }

    // It adds a new item on array
    function addElement(uint item) public {
        numbers.push(item);
    }

    // Get element at position
    function getElementAt(uint idx) public view returns (uint) {
        if(idx < getLength()) {
            return numbers[idx];
        }

        return 0;
    }

    // Removes the first element on the arra
    function popElement() public {
        numbers.pop();
    }

    /**
     * That function has to be marked as memory/pure because 
     * it doesn't change the blockchain state.
     */
    function temporaryArray() public {
        // The member functions .push and .pop doesn't exist inside "arr" variable, because it is a variable stored on memory
        uint[] memory arr = new uint[](3);
        arr[0] = 10;
        arr[1] = 20;
        arr[2] = 30;
        // To have that previous members, you have to copy the memory array to the storage array.
        numbers = arr; //--> But you will have to pay for do that!
    }
}