// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyAuction {
    string public articleName;
    string public articleImageUrl;
    string public articleDescription;

    constructor(
        string memory _articleName,
        string memory _articleImageUrl,
        string memory _articleDescription
    ) {
        articleName = _articleName;
        articleImageUrl = _articleImageUrl;
        articleDescription = _articleDescription;
    }

    function changeDescription(string memory _newDescription) public {
        articleDescription = _newDescription;
    }
}
