//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import "../src/ProposalContract.sol";

contract ProposalContractTest is Test {
    ProposalContract public proposalContract;

    address owner = address(0x1);

    function setUp() public {
        vm.prank(owner); //Simulated the owner deploying the contract
        proposalContract = new ProposalContract();
    }

    function testCreateProposal() public {
        vm.prank(owner);
        proposalContract.create("Proposal Title:",  "This is a test proposal", 10);
    
        //Retrievee the proposal with ID 1
        (
            string memory title,
            string memory description,
            uint256 approveCount,
            uint256 rejectCount,
            uint256 passCount,
            uint256 total_vote_to_end,
            bool current_state,
            bool is_active
        ) = proposalContract.getProposal(1);

        //Assert that the proposal details are correct
        assertEq(title, "Proposal Title:");
        assertEq(description, "This is a test proposal");
        assertEq(approveCount, 0);
        assertEq(rejectCount, 0);
        assertEq(passCount, 0);
        assertEq(total_vote_to_end, 10);
        assertEq(current_state, false);
        assertEq(is_active, true);
    }
}