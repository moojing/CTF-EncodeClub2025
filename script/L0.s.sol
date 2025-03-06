// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract DeployL0 is Script {
    function run() external {
        bytes memory bytecode = hex"6008600b5f3960085ff3fe602a5f5260205ff3";

        vm.startBroadcast();

        address contractAddress;

        assembly {
            contractAddress := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        console.log("L0 deployed at:", contractAddress);

        vm.stopBroadcast();
    }
}
