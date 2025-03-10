// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// BaseCTFTest.sol
import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/CTF.sol";

abstract contract BaseCTFTest is Test {
    CTF public ctfContract;
    address public user = address(vm.envAddress("USER_ADDRESS"));
    uint8 public levelNumber;
    address public levelAddress;

    function setUpCTF(uint8 _levelNumber) public {
        levelNumber = _levelNumber;

        string memory rpc_url = vm.envString("RPC_URL");
        console.log("rpc_url:", rpc_url);

        vm.createSelectFork(rpc_url);
        uint256 latestBlockNumber = block.number;
        console.log("latestBlockNumber:", latestBlockNumber);

        ctfContract = CTF(0x47bF301bB9B5Ec3fFb84448a95b3573b305456Db);

        bool isWhitelisted = ctfContract.whitelist(user);
        bool canSubmitSolution = ctfContract.canSubmit();
        levelAddress = ctfContract.levels(levelNumber);

        console.log("User whitelisted:", isWhitelisted);
        console.log("Submissions open:", canSubmitSolution);
        console.log("Level address:", levelAddress);
    }

    function getScoreAndGas() public view returns (uint256 score, uint256 gasUsage) {
        score = ctfContract.scores(user, levelNumber);
        gasUsage = ctfContract.gasUsed(user, levelNumber);
    }
}
