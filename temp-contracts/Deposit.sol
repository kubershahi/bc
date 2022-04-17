// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract Deposit {
    address[] public donors;
    string[] public msges;

    function donate(string memory m) public payable{
        require(msg.value>= 1 ether);
        donors.push(msg.sender);
        msges.push(m);
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function getDonors() public view returns(address){
        return address(donors[0]);
    }

    function getMsg() public view returns(string [] memory){
        return msges;
    }

}