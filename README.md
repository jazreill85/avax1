# ErrorHandling Smart Contract

This Solidity smart contract implements basic balance management with error handling using `require()`, `assert()`, and `revert()` functions. It allows users to deposit, withdraw, transfer funds, and redeem items based on their balance.

## Contract Overview

### Variables

- `balance`: Stores the total balance available in the contract.

### Constants

- `SOLDERING_WICK_COST`: Cost of the soldering wick (20 units).
- `ROSIN_COST`: Cost of the rosin (50 units).
- `SOLDER_SUCTION_COST`: Cost of the solder suction (10 units).

### Functions

#### Constructor

- `constructor()`: Initializes the contract with a balance of 0.

#### deposit

- `deposit(uint256 amount)`: Allows users to deposit a specified amount to the contract balance.
  - **Parameters**: `amount` (uint256) - The amount to be deposited.
  - **Requires**: `amount > 0`.

#### withdraw

- `withdraw(uint256 amount)`: Allows users to withdraw a specified amount from the contract balance.
  - **Parameters**: `amount` (uint256) - The amount to be withdrawn.
  - **Requires**: `amount <= balance`.
  - **Asserts**: `balance >= amount`.
  - **Reverts**: If `balance` is less than 0 after withdrawal.

#### transfer

- `transfer(address recipient, uint256 amount)`: Allows users to transfer a specified amount to another address.
  - **Parameters**: 
    - `recipient` (address) - The address to transfer the amount to.
    - `amount` (uint256) - The amount to be transferred.
  - **Requires**: 
    - `recipient` is not the zero address.
    - `amount > 10`.
    - `amount <= balance`.
  - **Asserts**: 
    - `balance >= 0`.

#### redeem

- `redeem(string memory item)`: Allows users to redeem an item using their balance.
  - **Parameters**: `item` (string) - The name of the item to redeem.
  - **Requires**: 
    - The item is recognized.
    - `cost <= balance`.
  - **Asserts**: `balance >= 0`.
  - **Reverts**: If `balance` is less than 0 after redeeming the item.
