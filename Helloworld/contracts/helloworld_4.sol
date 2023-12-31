// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    // string >> text
    string public message;
    address auctionOwner;
    uint256 public amount;
    address public sender;

    // events
    event AmountIncreased(address sender, uint256 amount);

    constructor(string memory _initialMessage) {
        message = _initialMessage;
        auctionOwner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == auctionOwner, "You are not the owner !!");
        _;
    }

    function pay() public payable {
        require(msg.value > 0, "Value must be more than 0");
        require(msg.value > amount, "Value must be above the stored amount");

        if (amount > 0) {
            // transfer amount from the contract's balance to the previous sender
            payable(sender).transfer(amount);
        }

        // Store new values
        amount = msg.value;
        sender = msg.sender;
        emit AmountIncreased(sender, amount);
    }

    function payOwner() public payable onlyOwner {
        address contractAddress = address(this);
        uint256 contractBalance = contractAddress.balance;
        require(contractBalance > 0, "Balance is 0");
        payable(auctionOwner).transfer(contractBalance);

        // Reset value since we now transfered the whole balance
        amount = 0;
    }

    function setMessage(string memory _newMessage) public onlyOwner {
        message = _newMessage;
    }
}
