pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Token {
    string public name = "FireToken";
    string public symbol = "FTKN";

    uint public totalSupply = 1000000;

    // address type variables store ethereum accounts.
    address public owner;

    //  a mapping is a key-value map. Here, we store each account balance.
    mapping (address=>uint256) balances;

    /**
    *   Contract initialization
    *   Constructor is executed only once when the contract is creates.
    */
    constructor () {
        //  the totalSupply is assigned to the transaction sender, whichnis the 
        //  account that is deploying the contract.
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }
    
    /**
        a function to transfer tokens.
        the 'external' modifier makes a contract only callable from outsidebthe contract.
     */

    function transfer(address to, uint256 amount) external {
        console.log("Sender balance is %s tokens", balances[msg.sender]);
        console.log("Trying to send %s tokens to %s", amount, to);
        // check if transactin sender has enough coins.
        // if `require`'s first argument evaluates to false, then the transaction will revert.

        require(balances[msg.sender] >= amount, "Not enough tokens.");

        // transfer the amount.

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    /**
    *    Read-only function to retrieve the token balance of a given account.
    *    The `view` modifier indicates that it doesn't modify the contract's
    *    state, which allows us to call it without executing a transaction.
     */
     function balanceOf(address account) external view returns (uint256) {
         return balances[account];
     }
}

