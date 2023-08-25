//SPDX-License-Identifier: MIT

// How users can interact and use the contract. (like minting new tokens, etc.)

pragma solidity 0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MintBasicNft is Script {
    string public constant PUG =
        "https://ipfs.io/ipfs/QmcJRiVTDEsFPWdUoMWMUr8R9VaqqWd64tWJahJh49JfZy?filename=AI-puppy-nft%20work.png";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PUG);
        vm.stopBroadcast();
    }
}
