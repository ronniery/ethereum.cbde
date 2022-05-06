// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Lottery {
    // It stands to 0.1 ETH
    uint256 private constant LOTTERY_BID = 0.1 ether;

    /**
     * 1. Only a payable address can participate on this game.
     * address[] public players; That is an array of plain address
     */
    address payable[] public players;
    address public manager;

    constructor() {
        /**
         * 2. remember: It holds the currend addres that is interacting with 
         * the contract, in that case it will have the address that deploys 
         * that contract.
         */
        manager = msg.sender;
    }

    // 3. Create a payable function to enable contract receive ETH
    receive() external payable {
        /** 
         * That function do validations on the code, throwing errors when it 
         * resolves to "false", any code before that validation WILL CONSUME GAS
         */
        require(msg.value == LOTTERY_BID, "The minimum amount expected for the bid must be equal to 0.1 ETH");

        // Here we are "casting", msg.sender to a payable address type.
        players.push(payable(msg.sender));
    }

    // 4. Create a getter function to return the entire balance for this contract
    function getBalance() public view returns (uint) {
        // Prevent another accounts to fetch contract's balance
        require(msg.sender == manager, "Only the manager can see the balance of the contract");
        return address(this).balance;
    }

    // 5. Generates a random number NOTE: THIS IS NOT A TRUSTABLE AND USABLE ON PRODUCTION WORLD
    function random() internal view returns (uint) {
        bytes memory packed = abi.encodePacked(block.difficulty, block.timestamp, players.length);
        return uint(keccak256(packed));
    }

    // 5. Now we can create a winner selector to choose a person and give them the reward
    function pickWinner() public {
        require(msg.sender == manager, "Only the manager can select an winner");
        require(players.length >= 3, "We need at least 3 players to start the game");

        uint rand = random();
        uint index = rand % players.length;
        address payable winner = players[index];

        // This function transfer the entire balance GIVEN to the function's holder
        winner.transfer(getBalance());
        // Now we have to reset the lottery to run it again.
        players = new address payable[](0);
    }
}