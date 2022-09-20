// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract BiometricsStorage {
    //1. Creates a canditate and stores his info
    //2. Keeps track of all cadidtate that are stored
    //2. has a functionality to retreive the most recent canditate stored
    struct Canditate {
        string name;
        string gender;
        uint256 age;
        uint256 id;
    }
    uint256 mostRecentCandidate;
    Canditate[] public canditate;

    mapping(uint256 => string) canditateToName;

    function retrieveRecentMostCandidate() public view returns (string memory) {
        return canditateToName[mostRecentCandidate];
    }

    function addCandidate(
        string memory _name,
        string memory _gender,
        uint256 _age,
        uint256 _id
    ) public {
        canditate.push(Canditate(_name, _gender, _age, _id));
        canditateToName[_id] = _name;
        mostRecentCandidate = _id;
    }
}
