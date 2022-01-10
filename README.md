# payableTruffleProject 

A simply smart contract to demonstrate :
> - payable, allowing a function to receive money.      
> - transfer        
 
 Logic :
 > - make sure that the user can not withdraw more than their balance
 > - correctly adjust the balance of the user after a withdrawal
 > - if someone doesn't have enough balance for their withdrawal, the function call should throw an error and revert the transaction.
 > - accept money and keep track of transfer money between different Ethereum      
 
 Test: 
 > - address 1 deposited 1 ether.. getBalance() will give us 1 ether balance for address 1.
 > - address 2 deposited 3 ether.. getBalance() will give us 2 ether balance for address 2.
 > - but the deployed contract will have 3 ether. 
 > - because we are only tracking the balance internally using "balance" mapping.	

 Migrate:
 > - truffle(development)> truffle console
 > - truffle(development)> migrate --reset

      Compiling your contracts...
      ===========================
      > Compiling .\contracts\Bank.sol
      > Compiling .\contracts\Migrations.sol
      > Artifacts written to D:\blockchain\payableTruffleProject\build\contracts
      > Compiled successfully using:
         - solc: 0.8.10+commit.fc410830.Emscripten.clang



      Starting migrations...
      ======================
      > Network name:    'development'
      > Network id:      5777
      > Block gas limit: 6721975 (0x6691b7)


      1_initial_migration.js
      ======================

         Replacing 'Migrations'
         ----------------------
         > transaction hash:    0x66e8ba3ae7bea8a1225ed42a0e86e134d01e18ba8a91e8cf6e245b8fc9883e98
         > Blocks: 0            Seconds: 0
         > contract address:    0x2ba9C99e9D8c596105FC0aEbd3466EF0268b4093
         > block number:        239
         > block timestamp:     1641791849
         > account:             0x949CE02E352E9Ed86AdcCeC797474Efaf6034e91
         > balance:             93.902883859987
         > gas used:            248854 (0x3cc16)
         > gas price:           20 gwei
         > value sent:          0 ETH
         > total cost:          0.00497708 ETH


         > Saving migration to chain.
         > Saving artifacts
         -------------------------------------
         > Total cost:          0.00497708 ETH


      2_payable_migration.js
      ======================

         Replacing 'Bank'
         ----------------
         > transaction hash:    0xe032e84cbc91b22e7e370b995139f6bddedd2f52f9df9ba5f8aa39fc478ef588
         > Blocks: 0            Seconds: 0
         > contract address:    0xC1156D9E6046DCA95adf45cEE101A8916eE46D26
         > block number:        241
         > block timestamp:     1641791851
         > account:             0x949CE02E352E9Ed86AdcCeC797474Efaf6034e91
         > balance:             93.891246599987
         > gas used:            539350 (0x83ad6)
         > gas price:           20 gwei
         > value sent:          0 ETH
         > total cost:          0.010787 ETH


         > Saving migration to chain.
         > Saving artifacts
         -------------------------------------
         > Total cost:            0.010787 ETH


      Summary
      =======
      > Total deployments:   2
      > Final cost:          0.01576408 ETH


      - Blocks: 0            Seconds: 0
      - Saving migration to chain.
      - Blocks: 0            Seconds: 0
      - Saving migration to chain.
