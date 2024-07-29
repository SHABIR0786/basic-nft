// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721{
    uint256 public counter;
    mapping(uint256 => string) s_counter_tokenURI;
    constructor() ERC721("Doge","Dog"){
        counter = 0;
    }

    function mintTokenURI(string memory tokenURI) public  {
        s_counter_tokenURI[counter] = tokenURI;
        _mint(msg.sender, counter);
        counter++;
    }

    function getTokenURI(uint256 tokenId) public view returns(string memory) {
       return s_counter_tokenURI[tokenId];
    }
}