// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import "../src/Level0.sol";

contract DeploymentGasTest is Test {
    function testDeploymentGas() public {
        Level0 lv0 = new Level0();
    }
}
