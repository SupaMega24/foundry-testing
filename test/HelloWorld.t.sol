// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract HelloWorldTest is Test {
    HelloWorld public helloWorld;

    function setUp() public {
        helloWorld = new HelloWorld();
    }

    function test_Greeting() public view {
        // test that the HelloWorld contract prooces "Hello, World!"
        assertEq(helloWorld.greeting(), "Hello, World!");
        console.log(helloWorld.greeting());
    }
}
