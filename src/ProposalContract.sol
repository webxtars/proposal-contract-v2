// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ProposalContract {
    //Counter to keeep track of the number of proposal IDs
    uint256 private counter;

    //Struct to represent a proposal 
    struct Proposal {
        string title; //Title of the proposal
        string description; //Description of the proposal
        uint256 approveCount; //Number of approvals for the proposal
        uint256 rejectCount; //Number of rejections for the proposal
        uint256 passCount; //Number of passes for the proposal
        uint256 total_vote_to_end; //When the total votes in the proposal reaches this number, the proposal is ended
        bool current_state; //This shows the current state of the proposal
        bool is_active; //This shows if the proposal is active or not
    }

    //Mapping to store proposals by their IDs
    mapping(uint256 => Proposal) public proposal_history;

    //function to create a new proposal
    function create(string calldata _title, string calldata _description,
    uint256 _total_vote_to_end) external {
        counter++;//increment the counter to generate a unique proposal ID
        proposal_history[counter] = Proposal({
            title: _title,
            description: _description,
            approveCount: 0,
            rejectCount: 0,
            passCount: 0,
            total_vote_to_end: _total_vote_to_end,
            current_state: false,
            is_active: true
        });
    } 

    //function to retrieve a proposal by its ID
    function getProposal(uint256 _proposal_id) external view returns (
        string memory title,
        string memory description,
        uint256 approveCount,
        uint256 rejectCount,
        uint256 passCount,
        uint256 total_vote_to_end,
        bool current_state,
        bool is_active
    ) {
        Proposal storage proposal = proposal_history[_proposal_id];
        return (
            proposal.title,
            proposal.description,
            proposal.approveCount,
            proposal.rejectCount,
            proposal.passCount,
            proposal.total_vote_to_end,
            proposal.current_state,
            proposal.is_active
        );
    }
}