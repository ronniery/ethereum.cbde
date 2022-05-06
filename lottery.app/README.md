The main idea behind the lottery application.

The Lottery Smart Contract - Planning an Design

Lottery algorithm
1. The lottery starts by accepting ETH transactions. Anyone having an Ethereum wallet can
send a fixed amount of 0.1 ETH to the contract’s address.
2. The players send ETH directly to the contract address and their Ethereum address is
registered. A user can send more transactions having more chances to win.
3. There is a <b>manager, the account that deploys and controls the contract.</b>
4. At some point, if there are at least 3 playesrs, he can pick a random winner from the
players list. Only the manager is allowed to see the contract balance and to randomly
select the winner.
5. The contract <b>will transfer the entire balance to the winner’s address</b> and the <b>lottery is
reset</b> and ready for the next round.