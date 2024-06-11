// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    uint256 public balance;

    // Item prices
    uint256 constant SOLDERING_WICK_COST = 20;
    uint256 constant ROSIN_COST = 50;
    uint256 constant SOLDER_SUCTION_COST = 10;

    constructor() {
        balance = 0;
    }

    // Function to deposit an amount to the balance
    function deposit(uint256 amount) public {
        // Ensure the amount is greater than 0
        require(amount > 0, "Deposit amount must be greater than zero");
        balance += amount;
    }

    // Function to withdraw an amount from the balance
    function withdraw(uint256 amount) public {
        // Ensure the amount is less than or equal to the balance
        require(amount <= balance, "Insufficient balance");


        assert(balance >= amount);

        balance -= amount;

        // Example of using revert for complex logic
        if (balance < 0) {
            revert("Balance cannot be negative");
        }
    }

    // Function to transfer balance to another address
    function transfer(address recipient, uint256 amount) public {
        // Ensure the recipient address is not the zero address
        require(recipient != address(0), "Invalid recipient address");
        assert(amount > 10);
        // Ensure there are sufficient funds to transfer
        require(amount <= balance, "Insufficient balance");

        balance -= amount;

        // Assert that the balance should be non-negative after transfer
        assert(balance >= 0);
    }

    // Function to redeem an item using balance
    function redeem(string memory item) public {
        uint256 cost;

        // Determine the cost of the item
        if (keccak256(abi.encodePacked(item)) == keccak256(abi.encodePacked("soldering wick"))) {
            cost = SOLDERING_WICK_COST;
        } else if (keccak256(abi.encodePacked(item)) == keccak256(abi.encodePacked("rosin"))) {
            cost = ROSIN_COST;
        } else if (keccak256(abi.encodePacked(item)) == keccak256(abi.encodePacked("solder suction"))) {
            cost = SOLDER_SUCTION_COST;
        } else {
            // If the item is not recognized, revert the transaction
            revert("Item not recognized");
        }

        // Ensure there are sufficient funds to redeem the item
        require(cost <= balance, "Insufficient balance to redeem this item");

        balance -= cost;

        // For example, balance should never be negative at this point
        assert(balance >= 0);

        if (balance < 0) {
            revert("Balance cannot be negative after redeeming item");
        }
    }
}
