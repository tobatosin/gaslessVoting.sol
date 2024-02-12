// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;




contract MyContract {
  // Set up contract interface
  address public daoAddress;
  // Include your DAO contract's ABI here
  // const daoABI = [...];

  constructor(address _daoAddress) {
    daoAddress = _daoAddress;
  }

  // Gasless voting function
  function gaslessVote(uint256 proposalId, bool vote, address signer, bytes memory signature) public {
    try VoteInterface(daoAddress).vote(proposalId, vote, signer, signature) {
      // Vote successful!
   
    } catch Error(string memory error) {
  // Error while voting
}
  }
}

interface VoteInterface {
  function vote(uint256 proposalId, bool vote, address signer, bytes memory signature) external returns (bool);
}
