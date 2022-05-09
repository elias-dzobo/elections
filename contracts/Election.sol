pragma solidity ^0.5.16;

contract Election {
    
    //Candidate Model
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    // Voter Mode
    struct Voter {
        string email;
        address wallet; 
    }

    mapping (uint => Candidate ) public candidates;
    mapping (address => bool) public voters;
    //store candidate count
    uint public candidateCount;

    event votedEvent (
        uint indexed _candidateId
    );

    function vote(uint _candidateId) public {
        require(!voters[msg.sender]);

        require(_candidateId >0 && _candidateId <= candidateCount);

        voters[msg.sender] = true;

        candidates[_candidateId].voteCount ++;

        emit votedEvent(_candidateId);
    }

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