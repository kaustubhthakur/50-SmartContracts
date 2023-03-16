// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Dchannel is ERC721 {
    uint256 public totalSupply;
    uint256 public totalServers;
    address public owner;
    struct Server {
        uint256 id;
        string name;
        uint256 cost;
    }
    mapping(uint256 => Server) public servers;
    mapping(uint256 => mapping(address => bool)) public joined;
    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) {
        owner = msg.sender;
    }

    function createServer(string memory _name, uint _cost) public onlyOwner {
        totalServers++;
        servers[totalServers] = Server(totalServers, _name, _cost);
    }

    function mint(uint256 _id) public payable {
        require(_id != 0);
        require(_id <= totalServers);
        require(joined[_id][msg.sender] == false);
        require(msg.value >= servers[_id].cost);

        joined[_id][msg.sender] = true;
        totalSupply++;

        _safeMint(msg.sender, totalSupply);
    }

    function getServer(uint256 _id) public view returns (Server memory) {
        return servers[_id];
    }

    function withdraw() public onlyOwner {
        (bool success, ) = owner.call{value: address(this).balance}("");
        require(success);
    }
}
