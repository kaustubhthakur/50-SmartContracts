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
    address public owner;

    event sendItem(
        address creator,
         address receiver,
          uint256 id
          );
    event createItem(
        string title,
        address indexed creator,
        string description,
        uint256 id
    );

    constructor() {
        owner = msg.sender;
    }

    mapping(uint256 => Post) public posts;
    uint256 public totalPost;

    function createPost(
        string memory _title,
        string memory _description
    ) external {
        totalPost++;
        posts[totalPost] = Post(_title, msg.sender, _description, totalPost);
        emit createItem(_title, msg.sender, _description, totalPost);
    }

    function sendPost(address _receiver, uint256 _id) external {
        emit sendItem(msg.sender, _receiver, _id);
    }

    function sendPostAndMakeThemOwner(address _receiver, uint256 _id) external {
        emit sendItem(msg.sender, _receiver, _id);
        owner = _receiver;
    }

    function updatePost(
        string memory _title,
        string memory _description,
        uint256 _id
    ) external {
        posts[_id].title = _title;
        posts[_id].description = _description;
    }

    function deletePost(uint256 _id) external {
        require(totalPost < _id, "post with that id doesnt exists");
        delete (posts[_id]);
    }
}
