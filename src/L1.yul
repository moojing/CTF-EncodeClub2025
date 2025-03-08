object "Level1Answer" {
  code {
    datacopy(0, dataoffset("runtime"), datasize("runtime"))
    return(0, datasize("runtime"))
  }
  
  object "runtime" {
    code {
      // 直接使用 0x00 而不是 0x80 作為結果存儲位置，這樣可以避免32字節的偏移量
      let result := 0x00
      
      // 載入所有輸入值並相加
      mstore(0x00, add(calldataload(4), calldataload(196)))
      mstore(0x20, add(calldataload(36), calldataload(228)))
      mstore(0x40, add(calldataload(68), calldataload(260)))
      mstore(0x60, add(calldataload(100), calldataload(292)))
      mstore(0x80, add(calldataload(132), calldataload(324)))
      mstore(0xa0, add(calldataload(164), calldataload(356)))
      
      // 直接返回，不使用變數
      return(0x00, 0xc0)
    }
  }
}