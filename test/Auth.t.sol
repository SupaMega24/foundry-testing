// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract AuthTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }

    function test_SetOwner() public {
        wallet.setOwner(address(1));
        assertEq(wallet.owner(), address(1));
        //console.log("New owner set to:", wallet.owner());
        console.log(
            "New owner set from:",
            address(this),
            "to:",
            wallet.owner()
        );
    }

    function test_RevertIf_NotOwner() public {
        vm.prank(address(1));
        vm.expectRevert("caller is not owner");
        wallet.setOwner(address(1));
    }

    function test_Revert_Again() public {
        // msg.sender is address(this)
        wallet.setOwner(address(1));

        // msg.sender is address(1)
        vm.startPrank(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        vm.stopPrank();

        // msg.sender is address(this)
        vm.expectRevert("caller is not owner");
        wallet.setOwner(address(1));
    }
}
