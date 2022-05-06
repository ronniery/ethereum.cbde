//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;

contract AuctionCreator {
    Auction[] public auctions;

    function createAuction() public {
        Auction contractAuction = new Auction(msg.sender);
        auctions.push(contractAuction);
    }
}

contract Auction {
    uint private WEEK_END = 40320;

    enum State { Started, Running, Ended, Canceled }
    State public auctionState;

    address payable public owner;
    uint public startBlock;
    uint public endBlock;
    string public ipfsHash;

    uint public highestBindingBid;
    address payable public highestBidder;

    mapping(address => uint) public bids;

    uint bidIncrement;

    constructor(address eoa) {
        owner = payable(eoa);
        auctionState = State.Running;
        startBlock = block.number;
        endBlock = startBlock + 3;
        ipfsHash = "";
        bidIncrement = 0.001 ether;
    }

    modifier notOwner () {
        require(msg.sender != owner, "The owner cannot place bids!");
        _;
    }

    modifier afterStart() {
        require(block.number >= startBlock, "The auction did not started yet");
        _;
    }

    modifier beforeEnd() {
        require(block.number <= endBlock, "The auction was already closed");
        _;
    }

    modifier onlyOwner () {
        require(msg.sender == owner);
        _;
    }

    function cancelAuction() public onlyOwner {
        auctionState = State.Canceled;
    }

    function finishAuction() public {
        require(auctionState == State.Canceled || block.number > endBlock, "To request money the auction must be canceled.");
        require(msg.sender == owner || bids[msg.sender] > 0, "Only owner or a bidder can cancel the auction or you don't have ether to request");

        address payable recipient;
        uint value;

        if (auctionState == State.Canceled) { // Auction was finished
            recipient = payable(msg.sender);
            value = bids[msg.sender];
        } else { // Auction was ended (not canceled)
            if (msg.sender == owner) { // This one is the owner
                recipient = owner;
                value = highestBindingBid;
            } else { // And this one is a bidder
               if (msg.sender == highestBidder) {
                   recipient = highestBidder;
                   value = bids[highestBidder] - highestBindingBid;
               } else { // This is neither the owner or the highestBidder
                    recipient = payable(msg.sender);
                    value = bids[msg.sender];
               }
            }
        }

        bids[recipient] = 0;

        recipient.transfer(value);
    }

    function min(uint a, uint b) pure internal returns (uint) {
        return a <= b ? a : b;
    }

    function placeBid() public payable notOwner afterStart beforeEnd {
        // Only place bid if the auction is running
        require(auctionState == State.Running, "The auction is not running");
        // Only the minimum value for a bid is acceptable
        require(msg.value >= 0.001 ether, "The minimum amount for a bid is 0.001 ether");

        // Updates the currentbid for the given sender 
        uint currentBid = bids[msg.sender] + msg.value;
        // Only continue if the current bid was high enought to surpas the previous one
        require(currentBid > highestBindingBid);

        // If yes, updates the sender bid with the current calculated bid
        bids[msg.sender] = currentBid;

        // If the current bid is less than the highest bid
        if(currentBid <= bids[highestBidder]) {
            // Get the minimum next bid
            highestBindingBid = min(currentBid + bidIncrement, bids[highestBidder]);
        } else {
            highestBindingBid = min(currentBid, bids[highestBidder] + bidIncrement);
            highestBidder = payable(msg.sender);
        }
    }
}