// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract Level5Answer {
    function solution(int256 a, int256 b) external pure returns (int256) {
        int256 avg = a / 2 + b / 2;

        // 使用位運算獲取最低位（奇偶性檢查）
        int256 remainderA = a & 1;
        int256 remainderB = b & 1;

        // 處理正數情況
        unchecked {
            // 合併所有正數情況到一個條件
            if (
                ((remainderA | remainderB) == 1 && avg >= 0) ||
                (remainderA & remainderB == 1) // 兩個都是奇數
            ) // 一個奇數且平均值非負
            {
                avg += 1;
            } else if (remainderA == -1 && remainderB == -1) avg -= 1;
        }
        return avg;
    }
}
