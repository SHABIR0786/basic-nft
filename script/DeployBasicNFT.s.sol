// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract DeployBasicNFT is Script {
    BasicNft basicNft;

    function setUp() public {

    }
    function run() public returns(BasicNft) {
        vm.startBroadcast();
        basicNft = new BasicNft();
        vm.stopBroadcast();
        return basicNft;
    }

}