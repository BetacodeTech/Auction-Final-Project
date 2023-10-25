// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyAuction {
    string public articleName;
    string public articleImageUrl;
    string public articleDescription;
    bool public auctionEnded;

    address auctionOwner;

    uint256 public highestBid;
    address payable public highestBidder;

    //events
    event HighestBidIncreased(address sender, uint256 amount);
    event AuctionEnded(address winner, uint256 winningBid);

    // Adding an underscore at the beguining of a variable name that is used as a parameter is a common practice.
    // This is done to avoid changing the incoming values.
    constructor(
        string memory _articleName,
        string memory _articleImageUrl,
        string memory _articleDescription
    ) {
        articleName = _articleName;
        articleImageUrl = _articleImageUrl;
        articleDescription = _articleDescription;
        auctionOwner = msg.sender;
    }

    /// modifiers
    modifier onlyOwner() {
        require(msg.sender == auctionOwner, "You are not the owner");
        _;
    }

    modifier auctionNotEnded() {
        require(!auctionEnded, "Auction has finished!");
        _;
    }

    /// Methods
    // Change the article description
    function setArticleDescription(
        string memory _newArticleDescription
    ) public onlyOwner auctionNotEnded {
        articleDescription = _newArticleDescription;
    }

    // make an offer to the auction article
    function bid() public payable auctionNotEnded {
        require(msg.value > 0, "Value must be more than 0");
        require(msg.value > highestBid, "Offer is below the highest bid!");

        if (highestBid != 0) {
            highestBidder.transfer(highestBid); // Refund the previously highest bidder
        }

        highestBid = msg.value;
        highestBidder = payable(msg.sender);
        emit HighestBidIncreased(highestBidder, highestBid);
    }

    function payOwner() public payable onlyOwner auctionNotEnded {
        // get contract balance
        address contractAddress = address(this);
        uint256 contractBalance = contractAddress.balance;

        // pay owner
        require(contractBalance > 0, "Balance is 0");
        payable(auctionOwner).transfer(contractBalance);

        // end auction
        emit AuctionEnded(highestBidder, highestBid);
        auctionEnded = true;
    }
}
