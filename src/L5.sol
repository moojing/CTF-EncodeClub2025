// SPDX-License-Identifier: MIT
import "forge-std/console.sol";

contract Level5Answer {
    // int256[3] public arr = [
    //     29162277257434089630960117974235446222058072960697271983609200739417235025243,
    //     28948022309329048855892746252171976963317496166410141009864396001978282410034,
    //     -28948022309329048855892746252171976963317496166410141009864396001978282410034
    //     ];
    // uint8 public count = 0;

    function solution(int256 a, int256 b) external pure returns (int256) {
        // 計算平均值，避免溢出
        int256 avg = a / 2 + b / 2;
        console.log("a / 2", a / 2);
        console.log("b / 2", b / 2);

        // 計算是否有丟失的小數部分
        bool aHasRemainder = a % 2 != 0;
        bool bHasRemainder = b % 2 != 0;
        console.log("a % 2", a % 2);
        console.log("b % 2", b % 2);

        // 如果兩個數都有餘數，需要加1
        if (aHasRemainder && bHasRemainder) {
            if (a > 0 && b > 0) {
                avg += 1; // 正 + 正，加1
            } else if (a < 0 && b < 0) {
                avg -= 1; // 負 + 負，減1（向下遠離零）
            }
            // 一正一負的情況抵消，不需處理
        }
        // 如果只有一個數有餘數
        else if (aHasRemainder || bHasRemainder) {
            // 看平均值符號來決定如何取整
            if (avg >= 0) {
                avg += 1; // 正數，向上加1
            } else {
                // avg -= 1; // 負數，向下減1
            }
        }
        console.log("avg_result", avg);
        return avg;
    }
}
