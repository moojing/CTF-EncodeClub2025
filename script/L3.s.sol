// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract DeployL1 is Script {
    function run() external {
        bytes memory bytecode =
            hex"603d600b5f39603d5ff3fe60048035016020813591015f37600961ffff5f51166002515f1a60085160018060d01b0319169060809260f01b835260f81b60028301526003820152f3";

        vm.startBroadcast();

        address contractAddress;

        assembly {
            contractAddress := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        console.log("L3 deployed at:", contractAddress);

        vm.stopBroadcast();
    }
}
