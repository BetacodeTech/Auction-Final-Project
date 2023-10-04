// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string public message;
    address auctionOwner;

    constructor(string memory _initialMessage) {
        message = _initialMessage;
        auctionOwner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == auctionOwner, "You are not the owner of this world !!");
        _;
    }

    function setMessage(string memory _newMessage) public onlyOwner {
        message = _newMessage;
    }
}
