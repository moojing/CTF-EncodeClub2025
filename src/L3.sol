// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/console.sol";

contract Level3Answer {
    function solution(bytes calldata packed) external pure returns (uint16 a, bool b, bytes6 c) {
        // Make sure the packed data has enough bytes
        if (packed.length < 9) revert("Packed data too short");

        // 解析 uint16 (從第一個字節開始)
        // 注意字節順序：高位在前，低位在後
        a = uint16(uint8(packed[0])) << 8 | uint16(uint8(packed[1]));

        // 解析 bool (第三個字節)
        b = packed[2] != 0;

        // 解析 bytes6 (後6個字節)
        uint256 word;
        assembly {
            // 加載 calldata 中從偏移 packed.offset + 3 開始的數據
            word := calldataload(add(packed.offset, 3))

            // 保留前 6 個字節 (48 位)
            // 這裡不需要 shl+shr，只需要與掩碼相與
            c := and(word, 0xFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000)
        }
        console.logBytes(abi.encode(word));
    }
}
