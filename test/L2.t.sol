// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/L2.sol";
import "./BaseCTF.sol";

contract L2Test is BaseCTFTest {
    Level2Answer public sortingContract;

    function setUp() public {
        setUpCTF(2);

        sortingContract = Level2Answer(0x325d82c739dE88a3a7Ec7bF0C551085022fe9ee5);
    }

    function testSortingRandomArray() public {
        // 建立一個未排序的陣列
        uint256[10] memory unsortedArray = [uint256(42), 17, 99, 5, 63, 27, 1, 75, 33, 50];

        // 獲取排序後的陣列
        uint256[10] memory sortedArray = sortingContract.solution(unsortedArray);

        // 驗證結果是否已排序
        for (uint256 i = 0; i < 9; i++) {
            assertTrue(
                sortedArray[i] <= sortedArray[i + 1], string.concat("Array not sorted at index ", vm.toString(i))
            );
        }

        // 驗證所有元素都存在（沒有丟失元素）
        bool[10] memory found;
        for (uint256 i = 0; i < 10; i++) {
            bool elementFound = false;
            for (uint256 j = 0; j < 10; j++) {
                if (unsortedArray[i] == sortedArray[j] && !found[j]) {
                    found[j] = true;
                    elementFound = true;
                    break;
                }
            }
            assertTrue(elementFound, string.concat("Element lost: ", vm.toString(unsortedArray[i])));
        }
    }

    function testSortingAlreadySorted() public {
        // 測試已經排序的陣列
        uint256[10] memory sortedInput = [uint256(1), 2, 3, 4, 5, 6, 7, 8, 9, 10];

        uint256[10] memory result = sortingContract.solution(sortedInput);

        // 驗證結果仍然有序
        for (uint256 i = 0; i < 9; i++) {
            assertEq(result[i], sortedInput[i], "Array elements changed when already sorted");
        }
    }

    function testSortingReversed() public {
        // 測試逆序的陣列
        uint256[10] memory reversedArray = [uint256(10), 9, 8, 7, 6, 5, 4, 3, 2, 1];

        uint256[10] memory sortedArray = sortingContract.solution(reversedArray);

        // 驗證結果已正確排序
        for (uint256 i = 0; i < 10; i++) {
            assertEq(sortedArray[i], i + 1, "Element at wrong position after sorting reversed array");
        }
    }

    function testSortingDuplicates() public {
        // 測試有重複元素的陣列
        uint256[10] memory arrayWithDuplicates = [uint256(5), 5, 3, 3, 8, 8, 1, 1, 9, 9];

        uint256[10] memory sortedArray = sortingContract.solution(arrayWithDuplicates);

        // 驗證結果已排序
        for (uint256 i = 0; i < 9; i++) {
            assertTrue(
                sortedArray[i] <= sortedArray[i + 1],
                string.concat("Array with duplicates not sorted at index ", vm.toString(i))
            );
        }
    }

    function testSortingLargeNumbers() public {
        // 測試大數字的情況
        uint256[10] memory largeNumbers = [
            type(uint256).max,
            type(uint256).max - 10,
            type(uint256).max / 2,
            type(uint256).max / 3,
            type(uint256).max - 5,
            type(uint256).max / 4,
            type(uint256).max - 100,
            type(uint256).max / 5,
            type(uint256).max / 10,
            0
        ];

        uint256[10] memory sortedArray = sortingContract.solution(largeNumbers);

        // 驗證結果已排序
        for (uint256 i = 0; i < 9; i++) {
            assertTrue(
                sortedArray[i] <= sortedArray[i + 1],
                string.concat("Array with large numbers not sorted at index ", vm.toString(i))
            );
        }
    }

    // 使用模糊測試來測試各種隨機輸入
    function testFuzzSorting(uint256[10] memory randomArray) public {
        uint256[10] memory sortedArray = sortingContract.solution(randomArray);

        // 驗證結果已排序
        for (uint256 i = 0; i < 9; i++) {
            assertTrue(
                sortedArray[i] <= sortedArray[i + 1],
                string.concat("Fuzz test: Array not sorted at index ", vm.toString(i))
            );
        }

        // 驗證元素沒有丟失
        for (uint256 i = 0; i < 10; i++) {
            bool found = false;
            for (uint256 j = 0; j < 10; j++) {
                if (randomArray[i] == sortedArray[j]) {
                    found = true;
                    break;
                }
            }
            assertTrue(found, "Fuzz test: Element lost during sorting");
        }
    }

    function testSubmitSolution() public {
        vm.startPrank(user);
        (uint256 scoreBefore, uint256 gasUsedBefore) = getScoreAndGas();
        console.log("Score before:", scoreBefore);
        console.log("Gas used before:", gasUsedBefore);

        ctfContract.submitSolution(levelNumber, address(sortingContract));

        (uint256 scoreAfter, uint256 gasUsedAfter) = getScoreAndGas();
        console.log("Score after:", scoreAfter);
        console.log("Gas used after:", gasUsedAfter);
        vm.stopPrank();
    }
}
