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

        // lv3Contract = Level3Answer(0x97278F704cCEE14CbB81d56a2bEbc47d5F7388b7);
        lv3Contract = new Level3Answer();
    }

    function testSolution() public {
        // 創建要測試的合約
        // Level3Answer level3 = new Level3Answer();

        // 測試輸入
        bytes memory testInput = hex"589401f1c92ffb36cf";

        // 調用要測試的函數
        (uint16 a, bool b, bytes6 c) = lv3Contract.solution(testInput);

        assertEq(a, 0x4941);
        assertEq(b, false);
        assertEq(c, hex"3974e3eaf5ed");
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
