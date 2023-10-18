// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    // string >> text
    string public message;
    address auctionOwner;
    uint256 public amount;
    address payable public sender;

    constructor(string memory _initialMessage) {
        message = _initialMessage;
        auctionOwner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == auctionOwner, "You are not the owner !!");
        _;
    }

    function pay() public payable {
        if (amount > 0) {
            sender.transfer(amount);
        }
        amount = msg.value;
        sender = payable(msg.sender);
    }

    // Example without the usage of a public internal variable
    function payBack() public payable {
        address convertedAddress = address(this);
        uint256 contractBalance = convertedAddress.balance;
        sender.transfer(contractBalance);
    }

    function setMessage(string memory _newMessage) public onlyOwner {
        message = _newMessage;
    }
}
