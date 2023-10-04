// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyAuction {
    /// Variables
    string public articleName;
    string public articleImageUrl;
    string public articleDescription;
    address auctionOwner;

    /// Constructor
    constructor(
        string memory _articleName,
        string memory _articleImageUrl,
        string memory _articleDescription
    ) {
        articleName = _articleName;
        articleImageUrl = _articleImageUrl;
        articleDescription = _articleDescription;
    }

    /// modifiers
    modifier onlyOwner() {
        require(msg.sender == auctionOwner, "You are not the owner");
        _;
    }

    /// Methods
    function changeDescription(string memory _newDescription) public onlyOwner {
        articleDescription = _newDescription;
    }
}
