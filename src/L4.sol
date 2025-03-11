// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/console.sol";

contract Level4Answer {
    /**
     * @dev Returns the greatest power of 2 that is less than or equal to the input value
     * @param number The input value to find the greatest power of 2 for
     * @return result The greatest power of 2 less than or equal to number
     */
    function solution(uint256 number) external pure returns (uint256) {
        if (number == 0) return 0;

        // Find the index of the most significant bit
        uint256 msb = 0;

        if (number >= 0x100000000000000000000000000000000) {
            number >>= 128;
            msb += 128;
        }
        if (number >= 0x10000000000000000) {
            number >>= 64;
            msb += 64;
        }
        if (number >= 0x100000000) {
            number >>= 32;
            msb += 32;
        }
        if (number >= 0x10000) {
            number >>= 16;
            msb += 16;
        }
        if (number >= 0x100) {
            number >>= 8;
            msb += 8;
        }
        if (number >= 0x10) {
            number >>= 4;
            msb += 4;
        }
        if (number >= 0x4) {
            number >>= 2;
            msb += 2;
        }
        if (number >= 0x2) msb += 1;

        // Return 2^msb
        return 1 << msb;
    }
}
