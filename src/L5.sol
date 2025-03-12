// SPDX-License-Identifier: MIT
import "forge-std/console.sol";

contract Level5Answer {
    function solution(int256 a, int256 b) external pure returns (int256) {
        // 計算平均值，避免溢出
        int256 avg = a / 2 + b / 2;

        // 直接計算餘數和，減少布爾運算
        int256 remainder = (a % 2) + (b % 2);

        // 簡化條件邏輯
        if (remainder == 2) {
            avg += 1; // 兩個正奇數
        } else if (remainder == -2) {
            avg -= 1; // 兩個負奇數
        } else if (remainder == 1) {
            if (avg >= 0) avg += 1; // 一個正奇數，正平均值向上取整
        } else if (remainder == -1) {
            // if (avg < 0) avg -= 1; // 一個負奇數，負平均值向下取整（遠離零）
        }

        return avg;
    }
}
