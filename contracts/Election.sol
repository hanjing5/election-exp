pragma solidity 0.5.16;

contract Election {
    // Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Read/write candidate, stored on-chain
    // this gives us an ID based look up for
    // each candidate
    // setting it to "public" provides us a
    // getting function
    mapping(uint => Candidate) public candidates;

    // Store Candidates count
    // In Solidity, there is no way to determine the size of a mapping, and no way to iterate over it, either. 
    // That's because any key in a mapping that hasn't been assigned a value yet will return a default value 
    // (an empty candidate in this case). For example, if we only had 2 candidates in this election, and we try 
    // to look up candidate #99, then the mapping will return an empty Candidate structure. 
    // This behavior makes it impossible to know how many candidates exist, and therefore we must use a counter cache.
    // also stored on the blockchain
    uint public candidatesCount;

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }
}