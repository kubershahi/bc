// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract lotto {
    address public manager;
    address payable[] public players;

    event winner(address winner);

    /**
     * @dev Set contract deployer as owner
     */
    constructor(){
        manager = msg.sender;
    }

    function enter() public payable{
        require(msg.value>=0.1 ether);
        players.push(payable(msg.sender));

    }

    function random() private view returns(uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

    function pickWinner() public {
        require(msg.sender == manager);
        uint index = random() % players.length;
        players[index].transfer(address(this).balance);
        emit winner(players[index]);
    }
}
