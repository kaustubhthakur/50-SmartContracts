// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "hardhat/console.sol";

contract Blog {
    struct Post {
        string title;
        address creator;
        string description;
        uint256 id;
    }
    event createItem(
        string title,
        address indexed creator,
        string description,
        uint256 id
    );

    mapping(uint256 => Post) public posts;
    uint256 public totalPost;

    function createPost(string memory _title, string memory _description)
        external
    {
        totalPost++;
        posts[totalPost] = Post(_title, msg.sender, _description, totalPost);
        emit createItem(_title, msg.sender, _description, totalPost);
    }

    function updatePost(string memory _name, string memory _description,uint256 _id) external 
    {
        
    }

    function deletePost(uint256 _id) external {
        require(totalPost < _id, "post with that id doesnt exists");
        delete (posts[_id]);
    }
}
