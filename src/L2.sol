// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Isolution2 {
    function solution(uint256[10] calldata unsortedArray) external returns (uint256[10] memory sortedArray);
}

contract Level2Answer is Isolution2 {
    function solution(uint256[10] calldata unsortedArray)
        external
        pure
        override
        returns (uint256[10] memory sortedArray)
    {
        // 複製輸入數組到記憶體
        for (uint256 i = 0; i < 10; i++) {
            sortedArray[i] = unsortedArray[i];
        }

        // 使用 unchecked 塊來節省 gas
        unchecked {
            // 硬編碼排序網絡實現
            // 第一階段
            compareAndSwap(sortedArray, 0, 1);
            compareAndSwap(sortedArray, 2, 3);
            compareAndSwap(sortedArray, 4, 5);
            compareAndSwap(sortedArray, 6, 7);
            compareAndSwap(sortedArray, 8, 9);

            // 第二階段
            compareAndSwap(sortedArray, 0, 2);
            compareAndSwap(sortedArray, 1, 3);
            compareAndSwap(sortedArray, 4, 6);
            compareAndSwap(sortedArray, 5, 7);
            compareAndSwap(sortedArray, 8, 9);

            // 第三階段
            compareAndSwap(sortedArray, 0, 4);
            compareAndSwap(sortedArray, 1, 5);
            compareAndSwap(sortedArray, 2, 6);
            compareAndSwap(sortedArray, 3, 7);
            compareAndSwap(sortedArray, 0, 8);

            // 第四階段
            compareAndSwap(sortedArray, 1, 9);
            compareAndSwap(sortedArray, 2, 8);
            compareAndSwap(sortedArray, 3, 9);
            compareAndSwap(sortedArray, 4, 8);
            compareAndSwap(sortedArray, 5, 9);

            // 第五階段
            compareAndSwap(sortedArray, 6, 8);
            compareAndSwap(sortedArray, 7, 9);
            compareAndSwap(sortedArray, 1, 2);
            compareAndSwap(sortedArray, 3, 4);
            compareAndSwap(sortedArray, 5, 6);

            // 第六階段
            compareAndSwap(sortedArray, 7, 8);
            compareAndSwap(sortedArray, 1, 4);
            compareAndSwap(sortedArray, 3, 6);
            compareAndSwap(sortedArray, 5, 7);

            // 第七階段
            compareAndSwap(sortedArray, 2, 4);
            compareAndSwap(sortedArray, 6, 8);
            compareAndSwap(sortedArray, 2, 3);
            compareAndSwap(sortedArray, 4, 5);
            compareAndSwap(sortedArray, 6, 7);

            // 最終階段 - 確保各個子序列合併正確
            compareAndSwap(sortedArray, 1, 2);
            compareAndSwap(sortedArray, 3, 5);
            compareAndSwap(sortedArray, 4, 6);
            compareAndSwap(sortedArray, 7, 8);

            // 確保最終排序
            compareAndSwap(sortedArray, 2, 3);
            compareAndSwap(sortedArray, 4, 5);
            compareAndSwap(sortedArray, 6, 7);
        }

        return sortedArray;
    }

    // 輔助函數: 比較並在需要時交換
    function compareAndSwap(uint256[10] memory arr, uint256 i, uint256 j) internal pure {
        if (arr[i] > arr[j]) {
            uint256 temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }
    }
}
