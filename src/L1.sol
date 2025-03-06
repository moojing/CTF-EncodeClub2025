// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/console.sol";

contract Level1Answer {
    function solution(uint256[2][3] calldata x, uint256[2][3] calldata y)
        external
        pure
        returns (uint256[2][3] memory finalArray)
    {
        for (uint256 i = 0; i < 3; i++) {
            for (uint256 j = 0; j < 2; j++) {
                finalArray[i][j] = x[i][j] + y[i][j];
                console.log("finalArray[%d][%d]: %d", i, j, finalArray[i][j]);
            }
        }
    }
}
