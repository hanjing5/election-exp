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

    mapping(address => bool) public voters;

    // Store Candidates count
    // In Solidity, there is no way to determine the size of a mapping, and no way to iterate over it, either. 
    // That's because any key in a mapping that hasn't been assigned a value yet will return a default value 
    // (an empty candidate in this case). For example, if we only had 2 candidates in this election, and we try 
    // to look up candidate #99, then the mapping will return an empty Candidate structure. 
    // This behavior makes it impossible to know how many candidates exist, and therefore we must use a counter cache.
    // also stored on the blockchain
    uint public candidatesCount;

    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    // msg.sender is a global object
    function vote(uint _candidateId) public {
        // require they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0  && _candidateId <= candidatesCount);

        // record that the voter has voted
        voters[msg.sender] = true;

        // update candidate vote count
        candidates[_candidateId].voteCount++;

        // trigger callback after voting event is over
        emit votedEvent(_candidateId);
    }

    event votedEvent (
        uint indexed _candidateId
    );

}