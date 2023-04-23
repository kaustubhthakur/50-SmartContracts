// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract BankingSystem {
    uint256 public totalAccounts;
    struct Account {
        uint256 balance;
        address owner;
        bool created;
        uint256 timestamp;
    }

    mapping(address => Account) public accounts;
    event createdAcc(uint256 amount, address owner);
    event amountDeposit(uint256 amount, address owner);
    event amountWithdraw(uint256 amount, address owner);
    event transferAmount(uint256 amount, address sender, address receiver);

    function createAccount(uint256 _amount) public {
        require(_amount > 0, "amount cant be negatve or zero");
        totalAccounts++;
        accounts[msg.sender] = Account(
            _amount,
            msg.sender,
            true,
            block.timestamp
        );
        emit createdAcc(_amount, msg.sender);
    }

    function depositMoney(uint256 _amount) external payable {
        require(accounts[msg.sender].created, "account doesnt exits");
        require(_amount > 0, "amount cant be 0 or -ve");
        accounts[msg.sender].balance += _amount;
        emit amountDeposit(_amount, msg.sender);
    }

    function withdrawMoney(uint256 _amount) external {
        require(accounts[msg.sender].created, "account doesnt exists");
        require(_amount > 0, "withdraw amount shoul be positive");
        require(
            _amount < accounts[msg.sender].balance,
            "amount cant be greater than balance"
        );
        accounts[msg.sender].balance -= _amount;
        emit amountWithdraw(_amount, msg.sender);
    }

    function transferMoney(uint256 _amount, address toUser) external 
    {
        require(accounts[msg.sender].created, "account doesnt exists");
        require(_amount > 0, "amount cant be negative or zero");
        require(_amount < accounts[msg.sender].balance, "invalid amount");
        accounts[msg.sender].balance -= _amount;
        accounts[toUser].balance += _amount;
        emit transferAmount(_amount, msg.sender, toUser);
    }

}
