// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Level2Answer {
    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray) {
        // 複製輸入數組到記憶體
        unchecked {
            sortedArray[0] = unsortedArray[0];
            sortedArray[1] = unsortedArray[1];
            sortedArray[2] = unsortedArray[2];
            sortedArray[3] = unsortedArray[3];
            sortedArray[4] = unsortedArray[4];
            sortedArray[5] = unsortedArray[5];
            sortedArray[6] = unsortedArray[6];
            sortedArray[7] = unsortedArray[7];
            sortedArray[8] = unsortedArray[8];
            sortedArray[9] = unsortedArray[9];

            // 排序網絡實現
            if (sortedArray[0] > sortedArray[1]) (sortedArray[0], sortedArray[1]) = (sortedArray[1], sortedArray[0]);
            if (sortedArray[2] > sortedArray[3]) (sortedArray[2], sortedArray[3]) = (sortedArray[3], sortedArray[2]);
            if (sortedArray[4] > sortedArray[5]) (sortedArray[4], sortedArray[5]) = (sortedArray[5], sortedArray[4]);
            if (sortedArray[6] > sortedArray[7]) (sortedArray[6], sortedArray[7]) = (sortedArray[7], sortedArray[6]);
            if (sortedArray[8] > sortedArray[9]) (sortedArray[8], sortedArray[9]) = (sortedArray[9], sortedArray[8]);

            if (sortedArray[0] > sortedArray[2]) (sortedArray[0], sortedArray[2]) = (sortedArray[2], sortedArray[0]);
            if (sortedArray[1] > sortedArray[3]) (sortedArray[1], sortedArray[3]) = (sortedArray[3], sortedArray[1]);
            if (sortedArray[4] > sortedArray[6]) (sortedArray[4], sortedArray[6]) = (sortedArray[6], sortedArray[4]);
            if (sortedArray[5] > sortedArray[7]) (sortedArray[5], sortedArray[7]) = (sortedArray[7], sortedArray[5]);
            if (sortedArray[0] > sortedArray[4]) (sortedArray[0], sortedArray[4]) = (sortedArray[4], sortedArray[0]);

            // 繼續以相同方式展開所有排序交換操作...
            if (sortedArray[1] > sortedArray[5]) (sortedArray[1], sortedArray[5]) = (sortedArray[5], sortedArray[1]);
            if (sortedArray[2] > sortedArray[6]) (sortedArray[2], sortedArray[6]) = (sortedArray[6], sortedArray[2]);
            if (sortedArray[3] > sortedArray[7]) (sortedArray[3], sortedArray[7]) = (sortedArray[7], sortedArray[3]);
            if (sortedArray[0] > sortedArray[8]) (sortedArray[0], sortedArray[8]) = (sortedArray[8], sortedArray[0]);
            if (sortedArray[1] > sortedArray[9]) (sortedArray[1], sortedArray[9]) = (sortedArray[9], sortedArray[1]);

            if (sortedArray[2] > sortedArray[8]) (sortedArray[2], sortedArray[8]) = (sortedArray[8], sortedArray[2]);
            if (sortedArray[3] > sortedArray[9]) (sortedArray[3], sortedArray[9]) = (sortedArray[9], sortedArray[3]);
            if (sortedArray[4] > sortedArray[8]) (sortedArray[4], sortedArray[8]) = (sortedArray[8], sortedArray[4]);
            if (sortedArray[5] > sortedArray[9]) (sortedArray[5], sortedArray[9]) = (sortedArray[9], sortedArray[5]);
            if (sortedArray[6] > sortedArray[8]) (sortedArray[6], sortedArray[8]) = (sortedArray[8], sortedArray[6]);

            if (sortedArray[7] > sortedArray[9]) (sortedArray[7], sortedArray[9]) = (sortedArray[9], sortedArray[7]);
            if (sortedArray[0] > sortedArray[1]) (sortedArray[0], sortedArray[1]) = (sortedArray[1], sortedArray[0]);
            if (sortedArray[2] > sortedArray[3]) (sortedArray[2], sortedArray[3]) = (sortedArray[3], sortedArray[2]);
            if (sortedArray[4] > sortedArray[5]) (sortedArray[4], sortedArray[5]) = (sortedArray[5], sortedArray[4]);
            if (sortedArray[6] > sortedArray[7]) (sortedArray[6], sortedArray[7]) = (sortedArray[7], sortedArray[6]);

            if (sortedArray[8] > sortedArray[9]) (sortedArray[8], sortedArray[9]) = (sortedArray[9], sortedArray[8]);
            if (sortedArray[1] > sortedArray[4]) (sortedArray[1], sortedArray[4]) = (sortedArray[4], sortedArray[1]);
            if (sortedArray[3] > sortedArray[6]) (sortedArray[3], sortedArray[6]) = (sortedArray[6], sortedArray[3]);
            if (sortedArray[1] > sortedArray[2]) (sortedArray[1], sortedArray[2]) = (sortedArray[2], sortedArray[1]);
            if (sortedArray[3] > sortedArray[4]) (sortedArray[3], sortedArray[4]) = (sortedArray[4], sortedArray[3]);

            if (sortedArray[5] > sortedArray[6]) (sortedArray[5], sortedArray[6]) = (sortedArray[6], sortedArray[5]);
            if (sortedArray[7] > sortedArray[8]) (sortedArray[7], sortedArray[8]) = (sortedArray[8], sortedArray[7]);
            if (sortedArray[2] > sortedArray[4]) (sortedArray[2], sortedArray[4]) = (sortedArray[4], sortedArray[2]);
            if (sortedArray[5] > sortedArray[7]) (sortedArray[5], sortedArray[7]) = (sortedArray[7], sortedArray[5]);
            if (sortedArray[2] > sortedArray[3]) (sortedArray[2], sortedArray[3]) = (sortedArray[3], sortedArray[2]);

            if (sortedArray[5] > sortedArray[6]) (sortedArray[5], sortedArray[6]) = (sortedArray[6], sortedArray[5]);
            if (sortedArray[3] > sortedArray[4]) (sortedArray[3], sortedArray[4]) = (sortedArray[4], sortedArray[3]);
            if (sortedArray[6] > sortedArray[7]) (sortedArray[6], sortedArray[7]) = (sortedArray[7], sortedArray[6]);
            if (sortedArray[3] > sortedArray[5]) (sortedArray[3], sortedArray[5]) = (sortedArray[5], sortedArray[3]);
            if (sortedArray[4] > sortedArray[6]) (sortedArray[4], sortedArray[6]) = (sortedArray[6], sortedArray[4]);

            if (sortedArray[4] > sortedArray[5]) (sortedArray[4], sortedArray[5]) = (sortedArray[5], sortedArray[4]);
        }
    }
}
