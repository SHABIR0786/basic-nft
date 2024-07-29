// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract Interactions is Script{
    string public constant tokenURI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft",block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }
    function mintNftOnContract(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        BasicNft(mostRecentlyDeployed).mintTokenURI(tokenURI);
        vm.stopBroadcast();
    
    }
}