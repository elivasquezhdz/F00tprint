// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract footprint is ERC721URIStorage {
  // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // We need to pass the name of our NFTs token and its symbol.
  constructor() ERC721 ("F00tprint NFT", "f00tCO2") {
    console.log("This is my NFT contract. Woah!");
  }

  // A function our user will hit to get their NFT.
  function makeAnEpicNFT() public {
     // Get the current tokenId, this starts at 0.
    uint256 newItemId = _tokenIds.current();

     // Actually mint the NFT to the sender using msg.sender.
    _safeMint(msg.sender, newItemId);

    // Set the NFTs data.
    //_setTokenURI(newItemId, "https://jsonkeeper.com/b/L048");   _setTokenURI(newItemId, "data:application/json;base64,PHN2ZyB3aWR0aD0iNTAwIiBoZWlnaHQ9IjUwMCIgdmVyc2lvbj0iMS4xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxkZWZzPgogICAgICA8bGluZWFyR3JhZGllbnQgaWQ9IkdyYWRpZW50MiIgeDE9IjAiIHgyPSIwIiB5MT0iMCIgeTI9IjEiPgogICAgICAgIDxzdG9wIG9mZnNldD0iMCUiIHN0b3AtY29sb3I9IiNmOGZmMDAiLz4KICAgICAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMzYWQ1OWYiLz4KICAgICAgPC9saW5lYXJHcmFkaWVudD4KICA8L2RlZnM+CgoKICA8c3R5bGU+LmJhc2UgeyBmaWxsOiB3aGl0ZTsgZm9udC1mYW1pbHk6IHNlcmlmOyBmb250LXNpemU6IDI4cHg7IH08L3N0eWxlPgogIDxzdHlsZT4uYWRkIHsgZmlsbDogd2hpdGU7IGZvbnQtZmFtaWx5OiBzZXJpZjsgZm9udC1zaXplOiAyMHB4OyB9PC9zdHlsZT4KCiAgPHJlY3QgeD0iMTAiIHk9IjEwIiByeD0iMTUiIHJ5PSIxNSIgd2lkdGg9IjQ4MCIgaGVpZ2h0PSI0ODAiIGZpbGw9InVybCgjR3JhZGllbnQyKSIvPgogIDx0ZXh0IHg9IjUwJSIgeT0iMTUlIiBjbGFzcz0iYWRkIiBkb21pbmFudC1iYXNlbGluZT0ibWlkZGxlIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5IaSAweDhDYUJjOUY3REMzZmQwODI4RDdBNzZhNmZlNTQ2NWY2RTU2ZjRjNzI8L3RleHQ+CiAgPHRleHQgeD0iNTAlIiB5PSIzMCUiIGNsYXNzPSJhZGQiIGRvbWluYW50LWJhc2VsaW5lPSJtaWRkbGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPllvdXIgZm9vdHByaW50IGlzIDU4LjAgVG9ucyBvZiBDMDI8L3RleHQ+CiAgPHRleHQgeD0iNTAlIiB5PSI1MCUiIGNsYXNzPSJiYXNlIiBkb21pbmFudC1iYXNlbGluZT0ibWlkZGxlIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5UaGF0IGlzIGxvdCE8L3RleHQ+CiAgPHRleHQgeD0iNTAlIiB5PSI3MCUiIGNsYXNzPSJiYXNlIiBkb21pbmFudC1iYXNlbGluZT0ibWlkZGxlIiB0ZXh0LWFuY2hvcj0ibWlkZGxlIj5Zb3UgY291bGQgdGFrZSBzb21lIGFjdGlvbnMgdG8gbG93ZXIgaXQ8L3RleHQ+CiAgPHRleHQgeD0iNTAlIiB5PSI4NSUiIGNsYXNzPSJhZGQiIGRvbWluYW50LWJhc2VsaW5lPSJtaWRkbGUiIHRleHQtYW5jaG9yPSJtaWRkbGUiPlRoYW50J3MgbGlrZSAwLjU2IEV0aCB0cmFuc2FjdGlvbnM8L3RleHQ+Cjwvc3ZnPgo==");

    
    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();
  }
}