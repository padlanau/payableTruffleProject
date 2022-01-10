// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

/**
 * @title  Bank  
 * @author Lodgerio Padlan
 * @dev 
        - make sure that the user can not withdraw more than their balance
        - correctly adjust the balance of the user after a withdrawal
        - if someone doesn't have enough balance for their withdrawal, the function call should throw an error and revert the transaction.

        - accept money and keep track of transfer money between different Ethereum      
        - test: 
            - address 1 deposited 1 ether.. getBalance() will give us 1 ether balance for address 1.
		    - address 2 deposited 3 ether.. getBalance() will give us 2 ether balance for address 2.
		    - but the deployed contract will have 3 ether. 
		    - because we are only tracking the balance internally using "balance" mapping.	

 * @notice  A simply smart contract to demonstrate 
            - payable, allowing a function to receive money.      
            - transfer        
*/

 contract Bank {
 
    mapping(address => uint) balance;
    
    event depositDone(uint amount, address indexed depositedTo);
    

    // To test:
    // enter an amount in the "Value" field in Remix and click deposit
    function deposit() public payable returns (uint)  {
        balance[msg.sender] += msg.value; // balance mapping is nothing to do with the balance of the smart contract 
                                          // it tracks(internal ballances) which address deposit what money.
        emit depositDone(msg.value, msg.sender);
        return balance[msg.sender];
    }
    
    function withdraw(uint amount) public returns (uint){
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;

        // address payable toSend = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        // toSend.transfer(amount);  // the address MUST be payable to transfer money
                                     // transfer has built-in error handling
        //                           // if transfer fails, it will show an error and revert the transaction 
        // OR
        payable(msg.sender).transfer(amount);
        return balance[msg.sender];
    }
    
    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }
    
    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Don't transfer money to yourself");
        
        uint previousSenderBalance = balance[msg.sender];
        
        _transfer(msg.sender, recipient, amount);
                
        assert(balance[msg.sender] == previousSenderBalance - amount);
    }
    
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }


}    