pragma solidity ^0.5.16;

contract Election {
    
    //Candidate Model
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    mapping (uint => Candidate ) public candidates;

    //store candidate count
    uint public candidateCount;

    function get() public view returns (uint) {
        return candidateCount;
    }

    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    } 

    function addCandidate (string memory _name) private {
        candidateCount ++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }

}