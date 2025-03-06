// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/L1.sol";
import "../src/CTF.sol";

contract CTFTest is Test {
    CTF public ctfContract;
    Level1Answer public lv1;
    address public user = vm.envAddress("USER_ADDRESS");
    uint8 public levelNumber = 1;

    function setUp() public {
        string memory rpc_url = vm.envString("RPC_URL");
        console.log("rpc_url:", rpc_url);

        vm.createSelectFork(rpc_url);
        uint256 latestBlockNumber = block.number;
        console.log("latestBlockNumber:", latestBlockNumber);

        ctfContract = CTF(0x47bF301bB9B5Ec3fFb84448a95b3573b305456Db);

        lv1 = new Level1Answer();

        bool isWhitelisted = ctfContract.whitelist(user);
        bool canSubmitSolution = ctfContract.canSubmit();
        address levelAddress = ctfContract.levels(levelNumber);

        console.log("User whitelisted:", isWhitelisted);
        console.log("Submissions open:", canSubmitSolution);
        console.log("Level address:", levelAddress);
    }

    function testMatrixAddition() public {
        uint256[2][3] memory x = [[uint256(1), uint256(2)], [uint256(3), uint256(4)], [uint256(5), uint256(6)]];
        uint256[2][3] memory y = [[uint256(7), uint256(8)], [uint256(9), uint256(10)], [uint256(11), uint256(12)]];
        uint256[2][3] memory expected =
            [[uint256(8), uint256(10)], [uint256(12), uint256(14)], [uint256(16), uint256(18)]];
        uint256[2][3] memory result = lv1.solution(x, y);

        for (uint256 i = 0; i < 3; i++) {
            for (uint256 j = 0; j < 2; j++) {
                assertEq(
                    result[i][j],
                    expected[i][j],
                    string.concat("Mismatch at position [", vm.toString(i), "][", vm.toString(j), "]")
                );
            }
        }
    }

    function testSubmitSolution() public {
        vm.startPrank(user);
        uint8 scoreBefore = ctfContract.scores(user, levelNumber);
        uint256 gasUsedBefore = ctfContract.gasUsed(user, levelNumber);

        console.log("Score before:", scoreBefore);
        console.log("Gas used before:", gasUsedBefore);

        ctfContract.submitSolution(levelNumber, address(lv1));

        uint8 scoreAfter = ctfContract.scores(user, levelNumber);
        uint256 gasUsedAfter = ctfContract.gasUsed(user, levelNumber);

        console.log("Score after:", scoreAfter);
        console.log("Gas used after:", gasUsedAfter);
    }
}
