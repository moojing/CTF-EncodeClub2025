// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/L0.sol";
import "./BaseCTF.sol";

contract L0Test is BaseCTFTest {
    L0 public lv0;

    function setUp() public {
        setUpCTF(0);
        lv0 = new L0();
    }

    function testSubmitSolution() public {
        vm.startPrank(user);
        (uint256 scoreBefore, uint256 gasUsedBefore) = getScoreAndGas();

        console.log("Score before:", scoreBefore);
        console.log("Gas used before:", gasUsedBefore);

        ctfContract.submitSolution(levelNumber, address(lv0));

        (uint256 scoreAfter, uint256 gasUsedAfter) = getScoreAndGas();

        console.log("Score after:", scoreAfter);
        console.log("Gas used after:", gasUsedAfter);
    }
}
