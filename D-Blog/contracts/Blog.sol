// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "hardhat/console.sol";

contract Blog {
    struct Post {
        string title;
        address creator;
        string description;
        uint id;
    }
    event createItem(
        string title,
        address indexed creator,
        string description,
        uint256 id
    );

    mapping(uint256 => Post) public posts;
    uint public totalPost;

    function createPost(
        string memory _title,
        string memory _description
    ) external {
        totalPost++;
        posts[totalPost] = Post(_title,msg.sender,_description,totalPost);
        emit createItem(_title, msg.sender, _description, totalPost);
    }
}
