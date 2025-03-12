// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract DeployL1 is Script {
    function run() external {
        bytes
            memory bytecode = hex"6096600b5f3960965ff3fe60443610609257632c81ea355f3560e01c146018575f80fd5b600435602435600280808405818405019307910701600281146089575b60025f038114607f575b60018114606a575b60015f03146057575b5f5260205ff35b5f81126062575b6050565b60019003605e565b5f8212156076575b6047565b90600101906072565b906001900390603f565b90600101906035565b5f80fd";

        vm.startBroadcast();

        address contractAddress;

        assembly {
            contractAddress := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        console.log("L5 deployed at:", contractAddress);

        vm.stopBroadcast();
    }
}
