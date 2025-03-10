// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/console.sol";

contract Level3Answer {
    function solution(bytes memory packed) external pure returns (uint16 a, bool b, bytes6 c) {
        // Make sure the packed data has enough bytes
        require(packed.length >= 9, "Packed data too short");

        console.logBytes(packed);
        a = uint16(uint8(packed[0])) << 8 | uint16(uint8(packed[1]));
        console.log("a:", a);

        // Extract bool (next 1 byte)
        // Any non-zero value is considered true in Solidity
        b = packed[2] != 0;
        console.log("b:", b);

        // Extract bytes6 (next 6 bytes)
        // We need to extract 6 bytes starting from the 4th position (index 3)
        bytes memory temp = new bytes(6);
        for (uint256 i = 0; i < 6; i++) {
            temp[i] = packed[i + 3];
        }

        // Convert the temporary bytes to bytes6
        assembly {
            c := mload(add(temp, 32))
        }
    }
}
