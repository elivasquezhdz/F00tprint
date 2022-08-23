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
    //_setTokenURI(newItemId, "https://jsonkeeper.com/b/L048");
       _setTokenURI(newItemId, "data:application/json;base64,eyJuYW1lIjoiZjAwdHByaW50IiwiZGVzY3JpcHRpb24iOiJhIG5mdCBvZiB5b3VyIGNhcmJvbiBmb290cHJpbnQiLCJpbWFnZSI6ImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjNhV1IwYUQwaU5UQXdJaUJvWldsbmFIUTlJalV3TUNJZ2RtVnljMmx2YmowaU1TNHhJaUI0Yld4dWN6MGlhSFIwY0RvdkwzZDNkeTUzTXk1dmNtY3ZNakF3TUM5emRtY2lQZ29nSUR4a1pXWnpQZ29nSUNBZ0lDQThiR2x1WldGeVIzSmhaR2xsYm5RZ2FXUTlJa2R5WVdScFpXNTBNaUlnZURFOUlqQWlJSGd5UFNJd0lpQjVNVDBpTUNJZ2VUSTlJakVpUGdvZ0lDQWdJQ0FnSUR4emRHOXdJRzltWm5ObGREMGlNQ1VpSUhOMGIzQXRZMjlzYjNJOUlpTXpSakpDT1RZaUx6NEtJQ0FnSUNBZ0lDQThjM1J2Y0NCdlptWnpaWFE5SWpFd01DVWlJSE4wYjNBdFkyOXNiM0k5SWlOQk9FTXdSa1lpTHo0S0lDQWdJQ0FnUEM5c2FXNWxZWEpIY21Ga2FXVnVkRDRLSUNBOEwyUmxabk0rQ2dvS0lDQThjM1I1YkdVK0xtSmhjMlVnZXlCbWFXeHNPaUIzYUdsMFpUc2dabTl1ZEMxbVlXMXBiSGs2SUhObGNtbG1PeUJtYjI1MExYTnBlbVU2SURJNGNIZzdJSDA4TDNOMGVXeGxQZ29nSUR4emRIbHNaVDR1WVdSa0lIc2dabWxzYkRvZ2QyaHBkR1U3SUdadmJuUXRabUZ0YVd4NU9pQnpaWEpwWmpzZ1ptOXVkQzF6YVhwbE9pQXlNSEI0T3lCOVBDOXpkSGxzWlQ0S0NpQWdQSEpsWTNRZ2VEMGlNVEFpSUhrOUlqRXdJaUJ5ZUQwaU1UVWlJSEo1UFNJeE5TSWdkMmxrZEdnOUlqUTRNQ0lnYUdWcFoyaDBQU0kwT0RBaUlHWnBiR3c5SW5WeWJDZ2pSM0poWkdsbGJuUXlLU0l2UGdvZ0lEeDBaWGgwSUhnOUlqVXdKU0lnZVQwaU1UVWxJaUJqYkdGemN6MGlZV1JrSWlCa2IyMXBibUZ1ZEMxaVlYTmxiR2x1WlQwaWJXbGtaR3hsSWlCMFpYaDBMV0Z1WTJodmNqMGliV2xrWkd4bElqNUlhU0F3ZURRNE56WmlNek5sTWpJMFFqRTFNekJsTm1abE0yWXlaRVpEUlRGQ01HTkJOVVEwTnpZek5FSThMM1JsZUhRK0NpQWdQSFJsZUhRZ2VEMGlOVEFsSWlCNVBTSXpNQ1VpSUdOc1lYTnpQU0poWkdRaUlHUnZiV2x1WVc1MExXSmhjMlZzYVc1bFBTSnRhV1JrYkdVaUlIUmxlSFF0WVc1amFHOXlQU0p0YVdSa2JHVWlQbGx2ZFhJZ1ptOXZkSEJ5YVc1MElHbHpJREl3TGpBZ1ZHOXVjeUJ2WmlCRE1ESThMM1JsZUhRK0NpQWdQSFJsZUhRZ2VEMGlOVEFsSWlCNVBTSTFNQ1VpSUdOc1lYTnpQU0ppWVhObElpQmtiMjFwYm1GdWRDMWlZWE5sYkdsdVpUMGliV2xrWkd4bElpQjBaWGgwTFdGdVkyaHZjajBpYldsa1pHeGxJajVVYUdGMElHbHpJR3h2ZENFOEwzUmxlSFErQ2lBZ1BIUmxlSFFnZUQwaU5UQWxJaUI1UFNJM01DVWlJR05zWVhOelBTSmlZWE5sSWlCa2IyMXBibUZ1ZEMxaVlYTmxiR2x1WlQwaWJXbGtaR3hsSWlCMFpYaDBMV0Z1WTJodmNqMGliV2xrWkd4bElqNVpiM1VnWTI5MWJHUWdkR0ZyWlNCemIyMWxJR0ZqZEdsdmJuTWdkRzhnYkc5M1pYSWdhWFE4TDNSbGVIUStDaUFnUEhSbGVIUWdlRDBpTlRBbElpQjVQU0k0TlNVaUlHTnNZWE56UFNKaFpHUWlJR1J2YldsdVlXNTBMV0poYzJWc2FXNWxQU0p0YVdSa2JHVWlJSFJsZUhRdFlXNWphRzl5UFNKdGFXUmtiR1VpUGxSb1lXNTBKM01nYkdsclpTQXdMakU1SUVWMGFDQjBjbUZ1YzJGamRHbHZibk04TDNSbGVIUStDand2YzNablBnbz0ifQ==");

    
    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();
  }
}