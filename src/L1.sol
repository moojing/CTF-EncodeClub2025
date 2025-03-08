// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Level1Answer {
    function solution(uint256[2][3] calldata x, uint256[2][3] calldata y)
        external
        pure
        returns (uint256[2][3] memory)
    {
        assembly {
            let result := mload(0x40)
            mstore(0x40, add(result, 192))

            mstore(result, add(calldataload(4), calldataload(196)))
            mstore(add(result, 32), add(calldataload(36), calldataload(228)))
            // x[0][1] + y[0][1]
            mstore(add(result, 32), add(calldataload(36), calldataload(228)))

            // x[1][0] + y[1][0]
            mstore(add(result, 64), add(calldataload(68), calldataload(260)))

            // x[1][1] + y[1][1]
            mstore(add(result, 96), add(calldataload(100), calldataload(292)))

            // x[2][0] + y[2][0]
            mstore(add(result, 128), add(calldataload(132), calldataload(324)))

            // x[2][1] + y[2][1]
            // mstore(add(result, 160), add(calldataload(164), calldataload(356)))

            // 直接從 assembly 返回結果
            return(result, 192)
        }
    }
}
