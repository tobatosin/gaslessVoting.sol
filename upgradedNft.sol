// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
contract NFTMarketplace {
    // NFT struct
    struct NFT {
        uint256 tokenId;
        address owner;
        uint256 price;
        bool isForSale;
    }

    // Mapping of token ID to NFT
    mapping(uint256 => NFT) public nfts;

    // Function to list an NFT for sale
    function listNFTForSale(uint256 tokenId, uint256 price) external {
        require(nfts[tokenId].owner == msg.sender, "You don't own this NFT");
        require(!nfts[tokenId].isForSale, "NFT is already listed for sale");

        nfts[tokenId].price = price;
        nfts[tokenId].isForSale = true;
    }
}