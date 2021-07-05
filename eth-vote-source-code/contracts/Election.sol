pragma solidity >=0.4.21 <0.7.0;

contract Election {

    uint public candidateCount =0;

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public voter;

     constructor() public {
        addCandidate('Batman'); 
        addCandidate('Superman');
    }

    event eventVote(

        uint indexed candidateid
    );

    function addCandidate(string memory name) private{
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount,name,0); 
    }
    function addVote(uint candidateid) public { 
        require(!voter[msg.sender]);
        require((candidateid > 0) && (candidateid <= candidateCount));
        voter[msg.sender] = true;
        candidates[candidateid].voteCount++;
        emit eventVote(candidateid);    
        }
}

