// SPDX-License-Identifier: MIT
object "Level3Answer" {
  code {
      // 部署運行時代碼
      datacopy(0, dataoffset("runtime"), datasize("runtime"))
      return(0, datasize("runtime"))
  }
  
  object "runtime" {
      code {
          // 確保 calldata 長度足夠
          if lt(calldatasize(), 13) {
              revert(0, 0)
          }
          
          // 清空返回所需的記憶體空間
          // 先初始化為零以避免殘留的數據
          mstore(0x00, 0)
          mstore(0x20, 0)
          mstore(0x40, 0)
          
          // 解析 uint16 (前兩個字節)
          // 這裡使用大端序 (高字節在前)
          let highByte := shl(8, byte(0, calldataload(4)))
          let lowByte := byte(1, calldataload(4))
          let a := or(highByte, lowByte)
          
          // 解析 bool (第三個字節)
          let b := iszero(iszero(byte(2, calldataload(4))))
          
          // 解析 bytes6 (接下來的 6 個字節)
          // 直接加載並遮罩
          let cWord := calldataload(7)
          let c := and(cWord, 0xFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000)
          
          // 調試用: 輸出 bytes6 到記憶體以便檢查
          // 輸出 uint16 (a)
          mstore(0x00, a)
          
          // 輸出 bool (b)
          mstore(0x20, b)
          
          // 輸出 bytes6 (c)
          mstore(0x40, c)
          
          // 返回所有值
          return(0x00, 0x60)
      }
  }
}