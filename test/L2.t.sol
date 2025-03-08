// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/L2.sol";
import "./BaseCTF.sol";

contract L2Test is BaseCTFTest {
    Level2Answer public lv2;

    function setUp() public {
        setUpCTF(2);

        lv2 = new Level2Answer();
    }

    function testSubmitSolution() public {}
}
