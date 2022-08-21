// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract MyEpicNFT is ERC721URIStorage {
  // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // We need to pass the name of our NFTs token and its symbol.
  constructor() ERC721 ("other nft", "nothing") {
    console.log("This is my NFT contract. Woah!");
  }

  // A function our user will hit to get their NFT.
  function makeAnEpicNFT() public {
     // Get the current tokenId, this starts at 0.
    uint256 newItemId = _tokenIds.current();

     // Actually mint the NFT to the sender using msg.sender.
    _safeMint(msg.sender, newItemId);

    // Set the NFTs data.
    //_setTokenURI(newItemId, "https://jsonkeeper.com/b/L048");
    _setTokenURI(newItemId, "data:application/json;base64,eyJuYW1lIjoiTE9MT25mdCIsImRlc2NyaXB0aW9uIjoiYSBjb29sIExPTE9uZnQiLCJpbWFnZSI6ImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjNhV1IwYUQwaU16VXdJaUJvWldsbmFIUTlJak0xTUNJZ2RtVnljMmx2YmowaU1TNHhJaUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lQZ29nSUR4a1pXWnpQZ29nSUNBZ1BHeHBibVZoY2tkeVlXUnBaVzUwSUdsa1BTSkhjbUZrYVdWdWRERWlQZ29nSUNBZ0lDQThjM1J2Y0NCamJHRnpjejBpYzNSdmNERWlJRzltWm5ObGREMGlNQ1VpTHo0S0lDQWdJQ0FnUEhOMGIzQWdZMnhoYzNNOUluTjBiM0F5SWlCdlptWnpaWFE5SWpVd0pTSXZQZ29nSUNBZ0lDQThjM1J2Y0NCamJHRnpjejBpYzNSdmNETWlJRzltWm5ObGREMGlNVEF3SlNJdlBnb2dJQ0FnUEM5c2FXNWxZWEpIY21Ga2FXVnVkRDRLQ2lBZ0lDQThjM1I1YkdVZ2RIbHdaVDBpZEdWNGRDOWpjM01pUGdvZ0lDQWdJQ0E4SVZ0RFJFRlVRVnNLSUNBZ0lDQWdJQ0FqY21WamRERWdleUJtYVd4c09pQjFjbXdvSTBkeVlXUnBaVzUwTVNrN0lIMEtJQ0FnSUNBZ0lDQXVjM1J2Y0RFZ2V5QnpkRzl3TFdOdmJHOXlPaUJ5WldRN0lIMEtJQ0FnSUNBZ0lDQXVjM1J2Y0RJZ2V5QnpkRzl3TFdOdmJHOXlPaUJpYkdGamF6c2djM1J2Y0MxdmNHRmphWFI1T2lBd095QjlDaUFnSUNBZ0lDQWdMbk4wYjNBeklIc2djM1J2Y0MxamIyeHZjam9nWW14MVpUc2dmUW9nSUNBZ0lDQmRYVDRLSUNBZ0lEd3ZjM1I1YkdVK0NpQWdQQzlrWldaelBnb2dJRHh6ZEhsc1pUNHVZbUZ6WlNCN0lHWnBiR3c2SUhkb2FYUmxPeUJtYjI1MExXWmhiV2xzZVRvZ2MyVnlhV1k3SUdadmJuUXRjMmw2WlRvZ05UQndlRHNnZlR3dmMzUjViR1UrQ2lBZ1BISmxZM1FnYVdROUluSmxZM1F4SWlCNFBTSXhNQ0lnZVQwaU1UQWlJSEo0UFNJeE5TSWdjbms5SWpFMUlpQjNhV1IwYUQwaU16QXdJaUJvWldsbmFIUTlJak13TUNJdlBnb2dJRHgwWlhoMElIZzlJalV3SlNJZ2VUMGlOVEFsSWlCamJHRnpjejBpWW1GelpTSWdaRzl0YVc1aGJuUXRZbUZ6Wld4cGJtVTlJbTFwWkdSc1pTSWdkR1Y0ZEMxaGJtTm9iM0k5SW0xcFpHUnNaU0krVEU5TVQweFBQQzkwWlhoMFBnbzhMM04yWno0S0NnPT0ifQ==");
    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();
  }
}