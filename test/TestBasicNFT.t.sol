//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {DeployBasicNFT} from "../script/DeployBasicNFT.s.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {Test,console} from "forge-std/Test.sol";

contract TestBasicNFT is Test {
    DeployBasicNFT public deployer;
    BasicNft public basicNft;
    string public constant tokenURI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    address public constant USER = address(1);
    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNft = deployer.run();
    }

    function testBasicName() public view {
        assert(keccak256(abi.encodePacked(basicNft.name())) == keccak256(abi.encodePacked("Doge")));
        assert(keccak256(abi.encodePacked(basicNft.symbol())) == keccak256(abi.encodePacked("Dog")));
    }

    function testMintToken() public {
        vm.startPrank(USER);
        basicNft.mintTokenURI(tokenURI);
        vm.stopPrank();
        assert(basicNft.balanceOf(USER) == 1);
    }

    function testTokenURI() public  {
        vm.startPrank(USER);
        basicNft.mintTokenURI(tokenURI);
        vm.stopPrank();
        assert(keccak256(abi.encodePacked(basicNft.getTokenURI(0))) == keccak256(abi.encodePacked(tokenURI)));
    }


}