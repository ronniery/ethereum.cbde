// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract Deposit {
    /**
     * The contract can only have one "receive" function, that function
     * will be executed whenever the contract receives transfers from external
     * owned account or calls were made via transfer address functions
     */
    receive() external payable {
    }

    /**
     * It is used when "msg.data" is not empty and also when a called function
     * from this contract is called, and it isn't matched
     */
    fallback() external payable {
    }

    // Returning the balance of the contract.
    function getBalance() public view returns (uint) {
        // this is the current contract, explicitly convertible to address, 
        // and balance is a member of any variable of type address. 
        return address(this).balance;
    }

    // Ether can be send and received by the contract in the trasaction that calls this function as well
    function sendEther() public payable {
        uint x;
        x++;
    }
}