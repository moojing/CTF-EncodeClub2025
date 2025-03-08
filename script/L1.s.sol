// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

contract DeployL1 is Script {
    function run() external {
        bytes memory bytecode =
            hex"6043600b5f3960435ff3fe60c435600435015f5260e435602435016020526101043560443501604052610124356064350160605261014435608435016080526101643560a4350160a05260c05ff3";

        vm.startBroadcast();

        address contractAddress;

        assembly {
            contractAddress := create(0, add(bytecode, 0x20), mload(bytecode))
        }

        console.log("L1 deployed at:", contractAddress);

        vm.stopBroadcast();
    }
}
