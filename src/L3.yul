object "Level3Answer" {
  code {
    datacopy(0, dataoffset("runtime"), datasize("runtime"))
    return(0, datasize("runtime"))
  }
  
  object "runtime" {
    code {
      // 從 calldata 獲取參數
      // 假設合約被直接調用（無函數選擇器）或通過 fallback
      // 我們需要處理 solution(bytes) 的 ABI 編碼
      
      // 跳過函數選擇器 (如果有)
      let dataOffset := 4
      
      // 如果參數是 bytes，需要獲取該 bytes 的偏移量、長度和數據
      let bytesOffset := calldataload(dataOffset)
      let dataStart := add(dataOffset, bytesOffset)
      let dataLength := calldataload(dataStart)
      let dataPtr := add(dataStart, 32)
      
      // 現在 dataPtr 指向實際的 bytes 數據
      // 將數據複製到內存以便處理
      calldatacopy(0, dataPtr, dataLength)
      
      // 提取 a, b, c 的值
      let a := and(mload(0), 0xFFFF)
      let b := byte(0, mload(2))
      let c := mload(8)  // 從偏移量 2+6=8 讀取
      c := and(c, 0xFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000)
      
      // 準備返回數據
      let returnData := 0x80
      mstore(returnData, shl(240, a))
      mstore(add(returnData, 2), shl(248, b))
      mstore(add(returnData, 3), c)
      
      return(returnData, 9)
    }
  }
}