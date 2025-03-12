// SPDX-License-Identifier: MIT
object "Level5Answer" {
  code {
      // 部署運行時代碼
      datacopy(0, dataoffset("runtime"), datasize("runtime"))
      return(0, datasize("runtime"))
  }
  
  object "runtime" {
      code {
          // 確保 calldata 長度足夠
          if lt(calldatasize(), 0x44) {
              revert(0, 0)
          }
          
          // 檢查函數選擇器 (solution 函數)
          let selector := shr(224, calldataload(0))
          if eq(selector, 0x2c81ea35) { // keccak256("solution(int256,int256)")的前4個字節
              // 從 calldata 中讀取兩個 int256 參數
              let a := calldataload(4)
              let b := calldataload(36)
              
              // 計算平均值，避免溢出
              let halfA := sdiv(a, 2)
              let halfB := sdiv(b, 2)
              let avg := add(halfA, halfB)
              
              // 計算餘數
              let remA := smod(a, 2)
              let remB := smod(b, 2)
              let remainder := add(remA, remB)
              
              // 根據餘數處理向上取整，使用if-else替代switch-case
              if eq(remainder, 2) {
                  // 兩個正奇數
                  avg := add(avg, 1)
              }
              if eq(remainder, sub(0, 2)) {
                  // 兩個負奇數
                  avg := sub(avg, 1)
              }
              if eq(remainder, 1) {
                  // 一個正奇數
                  if iszero(slt(avg, 0)) {  // avg >= 0
                      avg := add(avg, 1)
                  }
              }
              if eq(remainder, sub(0, 1)) {
                  // 一個負奇數
                  if slt(avg, 0) {  // avg < 0
                      avg := sub(avg, 1)
                  }
              }
              
              // 存儲結果到記憶體
              mstore(0, avg)
              
              // 返回結果
              return(0, 32)
          }
          
          // 如果函數選擇器不匹配，則回退
          revert(0, 0)
      }
  }
}