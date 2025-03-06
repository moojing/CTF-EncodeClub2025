object "MatrixAddition" {
  code {
    // Deployment code
    datacopy(0, dataoffset("runtime"), datasize("runtime"))
    return(0, datasize("runtime"))
  }
  
  object "runtime" {
    code {
      // Initialize counter to 0
      let i := 0
      
      // Loop start (using a for-loop style)
      for {} lt(i, 6) { i := add(i, 1) } {
        // Calculate offset: 32 * i + 64 (base offset)
        let offset := add(mul(0x20, i), 0x40)
        
        // Read from calldata x[i/2][i%2]
        let xValue := calldataload(offset)
        
        // Read from calldata y[i/2][i%2]
        let yValue := calldataload(add(offset, 0xc0))
        
        // Add them together
        let sum := add(xValue, yValue)
        
        // Store result
        mstore(mul(0x20, i), sum)
      }
      
      // Return result
      return(0, 0xc0)
    }
  }
}