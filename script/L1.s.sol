// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract DeployL1 is Script {
    function run() external {
        bytes memory bytecode =
            hex"6029600b5f3960295ff3fe5f5b60068110600d5760c05ff35b8060406001926020020160c0813591013501816020025201600156";

        vm.startBroadcast();

        address contractAddress;

        assembly {
            contractAddress := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        console.log("L1 deployed at:", contractAddress);

        vm.stopBroadcast();
    }
}
