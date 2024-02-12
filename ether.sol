const { ethers } = require('ethers');

// Set up provider and signer
const provider = new ethers.providers.JsonRpcProvider('YOUR_RPC_PROVIDER_URL');
const privateKey = 'YOUR_PRIVATE_KEY';
const signer = new ethers.Wallet(privateKey, provider);

// Set up contract interface
const daoAddress = 'YOUR_DAO_CONTRACT_ADDRESS';
const daoABI = [
  // Include your DAO contract's ABI here
];
const daoContract = new ethers.Contract(daoAddress, daoABI, signer);

// Gasless voting function
async function gaslessVote(proposalId, vote) {
  try {
    // Generate a signature for the vote
    const message = ethers.utils.solidityKeccak256(['uint256', 'bool'], [proposalId, vote]);
    const signature = await signer.signMessage(ethers.utils.arrayify(message));

    // Call the DAO contract's vote function
    const tx = await daoContract.vote(proposalId, vote, signature);
    await tx.wait();

    console.log('Vote successful!');
  } catch (error) {
    console.error('Error while voting:', error);
  }
}

// Example usage
const proposalId = 1;
const vote = true;

gaslessVote(proposalId, vote);