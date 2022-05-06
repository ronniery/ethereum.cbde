## Smart Contract for a Decentralized Auction like an eBay alternative;

1. The Auction has an owner (the person who sells a good or service), a start and an end
date;
2. The owner can cancel the auction if there is an emergency or can finalize the auction
after its end time;
3. People are sending ETH by calling a function called placeBid(). The sender’s address
and the value sent to the auction will be stored in mapping variable called bids;
4. Users are incentivized to bid the maximum they’re willing to pay, but they are not bound
to that full amount, but rather to the previous highest bid plus an increment. <b>The
contract will automatically bid up to a given amount;</b>
5. The highestBindingBid is the selling price and the highestBidder the person who won
the auction;
6. After the auction ends the owner gets the <b>highestBindingBid</b> and everybody else
withdraws their own amount;

## The placebid() function

bids[0x123…] = 40 <br>
bids[0xabc…] = 70 <br>
bidIncrement = 10 <br>
highestBidder = 0xabc… <br>
highestBindingBid = 50 <br>

0x123... is sending 100 wei <br>
bids[0x123…] = 40 + 100= 140 <br>
highestBindingBid = min(140, 70+10) = 80