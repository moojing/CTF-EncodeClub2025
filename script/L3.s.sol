// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract DeployL1 is Script {
    function run() external {
        bytes memory bytecode =
            hex"6031600b5f3960315ff3fe600d3610602d576004358060f01c9060021a151560018060d01b031960073516915f5260205260405260605ff35b5f80fd";

        vm.startBroadcast();

        address contractAddress;

        assembly {
            contractAddress := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        console.log("L3 deployed at:", contractAddress);

        vm.stopBroadcast();
    }
}
