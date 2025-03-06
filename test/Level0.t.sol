// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Level0.sol";
import "../src/CTF.sol";

contract CTFTest is Test {
    CTF public ctfContract;
    Level0 public lv0;
    address public user = vm.envAddress("USER_ADDRESS");
    uint8 public levelNumber = 0;

    function setUp() public {
        string memory rpc_url = vm.envString("RPC_URL");
        console.log("rpc_url:", rpc_url);

        vm.createSelectFork(rpc_url);
        uint256 latestBlockNumber = block.number;
        console.log("latestBlockNumber:", latestBlockNumber);

        ctfContract = CTF(0x47bF301bB9B5Ec3fFb84448a95b3573b305456Db);

        lv0 = new Level0();

        bool isWhitelisted = ctfContract.whitelist(user);
        bool canSubmitSolution = ctfContract.canSubmit();
        address levelAddress = ctfContract.levels(levelNumber);

        console.log("User whitelisted:", isWhitelisted);
        console.log("Submissions open:", canSubmitSolution);
        console.log("Level address:", levelAddress);
    }

    function testSubmitSolution() public {
        vm.startPrank(user);
        uint8 scoreBefore = ctfContract.scores(user, levelNumber);
        uint256 gasUsedBefore = ctfContract.gasUsed(user, levelNumber);

        console.log("Score before:", scoreBefore);
        console.log("Gas used before:", gasUsedBefore);

        ctfContract.submitSolution(levelNumber, address(lv0));

        uint8 scoreAfter = ctfContract.scores(user, levelNumber);
        uint256 gasUsedAfter = ctfContract.gasUsed(user, levelNumber);

        console.log("Score after:", scoreAfter);
        console.log("Gas used after:", gasUsedAfter);

        // assertGt(scoreAfter, scoreBefore, "Score should increase");
    }
}
