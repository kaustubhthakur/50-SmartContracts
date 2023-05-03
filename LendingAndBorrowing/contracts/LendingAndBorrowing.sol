// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

 import "hardhat/console.sol";
contract LendingAndBorrowing {
    address public owner;
    mapping(address => uint256) public borrowers;
    uint256 public totalBorrowed;

    constructor() {
        owner = msg.sender;
    }

    uint256 public poolAmount;

    function Deposit() public payable {
        require(owner == msg.sender, "not a lender");
        poolAmount += msg.value;
    }

    modifier notOwner() {
        require(msg.sender != owner, "it is a owner");
        _;
    }

    function BorrowMoney(uint256 _amount) external payable  notOwner {
        require(_amount<poolAmount,"invalid amount");
        borrowers[msg.sender] += _amount;
        payable(msg.sender).transfer(_amount);
        totalBorrowed += _amount;
        poolAmount -= _amount;
    }

    function withdrawAllMoney() public payable {
        require(lenders == msg.sender, "not owner");
        payable(msg.sender).transfer(poolAmount);
        poolAmount = 0;
    }
}