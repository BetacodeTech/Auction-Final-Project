// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyAuction {
    string public articleName;
    string public articleImageUrl;
    string public articleDescription;

    address auctionOwner;

    uint256 public highestBid;
    address payable public highestBidder;

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

    /// Methods
    // Change the article description
    function setArticleDescription(
        string memory _newArticleDescription
    ) public onlyOwner {
        articleDescription = _newArticleDescription;
    }

    // make an offer to the auction article
    function bid() public payable {
        require(msg.value > highestBid, "Offer is below the highest bid!");
        if (highestBid != 0) {
            highestBidder.transfer(highestBid); // Refund the previously highest bidder
        }
        highestBid = msg.value;
        highestBidder = payable(msg.sender);
    }
}
