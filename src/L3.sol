// interface Isolution3 {
//     function solution(bytes memory packed) external returns (uint16 a, bool b, bytes6 c);
// }

contract Level3Answer {
    function solution(bytes memory packed) public pure returns (uint16 a, bool b, bytes6 c) {
        require(packed.length >= 9, "Input too short");

        // 提取 uint16 a (第1-2字節)
        a = uint16(uint8(packed[0])) * 256 + uint16(uint8(packed[1]));

        // 提取 bool b (第3字節)
        b = packed[2] != 0;

        // 提取 bytes6 c (從第9字節開始的6字節)
        bytes memory cBytes = new bytes(6);
        for (uint256 i = 0; i < 6; i++) {
            // 從 packed[8+i] 讀取，對應於 "add(ptr, 6)" 在 assembly 中的位置
            if (8 + i < packed.length) {
                cBytes[i] = packed[8 + i];
            }
        }

        assembly {
            c := mload(add(cBytes, 32))
        }
    }
}
