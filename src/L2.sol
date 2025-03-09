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
        for (uint256 i = 0; i < 10; i++) {
            sortedArray[i] = unsortedArray[i];
        }

        unchecked {
            for (uint256 i = 1; i < 10; i++) {
                uint256 key = sortedArray[i];
                int256 j = int256(i) - 1;

                while (j >= 0 && sortedArray[uint256(j)] > key) {
                    sortedArray[uint256(j + 1)] = sortedArray[uint256(j)];
                    j--;
                }
                sortedArray[uint256(j + 1)] = key;
            }
        }

        return sortedArray;
    }
}
