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

    function runTest() public {
        // 創建要測試的合約
        // Level3Answer level3 = new Level3Answer();

        // 測試輸入
        bytes memory testInput = hex"83fb00d58be7d5c699";

        // 調用要測試的函數
        (uint16 a, bool b, bytes6 c) = lv3Contract.solution(testInput);

        // 檢查結果是否符合預期
        bool success = (a == 0) && (b == true) && (c == hex"860000000000");

        // 輸出測試結果
        emit TestResult(success, success ? "Test passed!" : "Test failed!");

        // 如果測試失敗，輸出實際結果以幫助調試
        if (!success) {
            emit ActualResults(a, b, bytes32(c));
        }
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
