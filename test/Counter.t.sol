// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, stdError, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    // test to add 1 to count
    function test_CounterIncreases() public {
        counter.inc(); // increment
        assertEq(counter.count(), 1); // expected value starting from 0

        // log results
        console.log("Counter increases to:", counter.count());
    }

    // Test should fail due to underflow
    function test_RevertWhen_CounterDecreasesAtZero() public {
        vm.expectRevert(stdError.arithmeticError);
        counter.dec();
    }

    // test to decrease by 1 from 5 to get 4
    function test_CounterDecreases() public {
        counter.inc(); // increment first
        counter.inc(); // increment second
        counter.inc(); // increment third
        counter.inc(); // increment fourth
        counter.inc(); // increment fifth
        // log increment results
        console.log("Counter increases to:", counter.count());

        counter.dec(); // decrement
        assertEq(counter.count(), 4); // expected value after decrement

        // log results
        console.log("Counter decreases to:", counter.count());
    }
}
