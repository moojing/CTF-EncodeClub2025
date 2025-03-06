object "L0" {
  code {
    datacopy(0, dataoffset("runtime"), datasize("runtime"))
    return(0, datasize("runtime"))
  }
  
  object "runtime" {
    code {
      // 直接返回 42 (0x2a)
      mstore(0, 0x2a)
      return(0, 32)
    }
  }
}