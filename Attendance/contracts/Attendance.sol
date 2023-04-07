// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "hardhat/console.sol";

contract Attendance {
    uint256 public totalSubjects;
    uint256 public totalStudents;
    struct Subject {
        string title;
        string faculty;
        uint id;
        address creator;
    }
    struct Student {
        string name;
        uint256 rollNo;
    }
    mapping(uint256 => Subject) public subjects;
    mapping(uint256 => Student) public students;
modifier onlyStudent()
{
    require(msg.sender==owner,"not factuly")
}
    function createSubject(string memory _title,string memory _faculty) external 
    {
        totalSubjects++;
        subjects[totalStudents] = Subject(_title,_faculty,totalSubjects);
    }
    function createStudent() external {}


     function enterClass() external onlyStudent
     {

     }
    function getStudent() external view returns(address)
    {

    }
}
