// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/L3.sol";
import "./BaseCTF.sol";

contract L3Test is BaseCTFTest {
    Level3Answer public lv3Contract;

    event TestResult(bool success, string message);
    event ActualResults(uint16 a, bool b, bytes32 c);

    function setUp() public {
        setUpCTF(3);

        lv3Contract = new Level3Answer();
    }

    function testSolution() public {
        // 創建要測試的合約
        // Level3Answer level3 = new Level3Answer();

        // 測試輸入
        bytes memory testInput = hex"eb1a01d1c1db5c3dfc";

        // 調用要測試的函數
        (uint16 a, bool b, bytes6 c) = lv3Contract.solution(testInput);

        assertEq(a, 0xeb1a);
        assertEq(b, true);
        assertEq(c, hex"d1c1db5c3dfc");
    }

    function testSubmitSolution() public {
        vm.startPrank(user);
        (uint256 scoreBefore, uint256 gasUsedBefore) = getScoreAndGas();
        console.log("Score before:", scoreBefore);
        console.log("Gas used before:", gasUsedBefore);

        ctfContract.submitSolution(levelNumber, address(lv3Contract));

        (uint256 scoreAfter, uint256 gasUsedAfter) = getScoreAndGas();
        console.log("Score after:", scoreAfter);
        console.log("Gas used after:", gasUsedAfter);
        vm.stopPrank();
    }
}
