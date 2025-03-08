// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/L1.sol";
import "./BaseCTF.sol";

contract L1Test is BaseCTFTest {
    Level1Answer public lv1;

    function setUp() public {
        setUpCTF(1);
        lv1 = new Level1Answer();
    }

    // function testMatrixAddition() public {
    //     uint256[2][3] memory x = [[uint256(1), uint256(2)], [uint256(3), uint256(4)], [uint256(5), uint256(6)]];
    //     uint256[2][3] memory y = [[uint256(7), uint256(8)], [uint256(9), uint256(10)], [uint256(11), uint256(12)]];
    //     uint256[2][3] memory expected =
    //         [[uint256(8), uint256(10)], [uint256(12), uint256(14)], [uint256(16), uint256(18)]];
    //     uint256[2][3] memory result = lv1.solution(x, y);

    //     for (uint256 i = 0; i < 3; i++) {
    //         for (uint256 j = 0; j < 2; j++) {
    //             assertEq(
    //                 result[i][j],
    //                 expected[i][j],
    //                 string.concat("Mismatch at position [", vm.toString(i), "][", vm.toString(j), "]")
    //             );
    //         }
    //     }
    // }

    function testSubmitSolution() public {
        vm.startPrank(user);

        (uint256 scoreBefore, uint256 gasUsedBefore) = getScoreAndGas();
        console.log("Score before:", scoreBefore);
        console.log("Gas used before:", gasUsedBefore);

        ctfContract.submitSolution(levelNumber, address(lv1));

        (uint256 scoreAfter, uint256 gasUsedAfter) = getScoreAndGas();
        console.log("Score after:", scoreAfter);
        console.log("Gas used after:", gasUsedAfter);
        vm.stopPrank();
    }
}
