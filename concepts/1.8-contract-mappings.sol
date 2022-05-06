// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract Auction {
    /**
     * Keys for mappings can't be other maps, dynamic array, enum or struct, 
     * the value can be any type including mapping.
     *
     * It is ALWAYS SAVED IN STORAGE! (cost)
     */
    mapping(address => uint) public bids;

    /**
     * That modifier called "payable" means that the contract is able
     * to receive funds in ETH.
     */
    function bid() payable public {
        bids[msg.sender] = msg.value;
    }
}