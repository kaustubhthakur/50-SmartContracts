// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Uncomment this line to use console.log
import "hardhat/console.sol";

contract DChatServer {
    event Message(
        address indexed sender,
        address indexed receiver,
        string name,
        string message
    );
    address public creator;
    address public buyer;
    mapping(uint256 => mapping(address => bool)) public people;
    uint public totalpeople;
    //server structure
    struct Server {
        string name;
        uint id;
        address creator;
        uint cost;
    }
    mapping(uint256 => Server) public servers;

    //function that create server
    function createServer(string memory _name, uint _id,uint _cost) external {
        totalpeople++;
        servers[totalpeople] = Server(_name, _id, msg.sender,_cost);
    }

    //sendMessage function
    //sends message to the address who is present/joined the server
    function sendMessage(
        uint _id,
        address _receiver,
        string memory _name,
        string memory _message
    ) external {
        require(people[_id][_receiver] == true, "person is not in the server");
        emit Message(msg.sender, _receiver, _name, _message);
    }

    function getServer(uint _id) external view returns (Server memory) {
        return servers[_id];
    }

    function globalMessage(
        address _receiver,
        string memory _name,
        string _message
    ) external {
        emit Message(msg.sender, _receiver, _name, _message);
    }

}
