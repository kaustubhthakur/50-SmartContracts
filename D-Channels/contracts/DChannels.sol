// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


 import "hardhat/console.sol";
 import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Dchannels is ERC721 
{
    uint256 public totalSupply;
    uint256 public totalServers;
    address public owner;
    struct Server 
    {
        uint256 id;
        string name;
        uint256 cost;
    }
    mapping(uint256 => Server) public servers;
    mapping(uint256 => mapping(address => bool)) public joined;
    modifier onlyOwner ()
    {
        require(msg.sender==owner,"not owner");
        _;
    }
     constructor(string memory _name, string memory _symbol)
        ERC721(_name, _symbol)
    {
        owner = msg.sender;
    }
    function createServer(string memory _name,uint _cost) public onlyOwner
    {

    }
}