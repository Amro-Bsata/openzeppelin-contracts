// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./OwnerNft.sol";
import "./FanNft.sol";

contract NftFactory{
  
string public song_name;
uint32 public maxSupply =0 ;
OwnerNft owner_nft;
FanNft fan_nft;
address public owner_nft_contract;
address public fan_nft_contract;
address public test;

constructor(string memory _song_name, uint32 supply) 
    {
      song_name = _song_name;
      maxSupply = supply; 
      fan_nft   = new FanNft(song_name,supply); // Erstellung eines neuen Contracts
      owner_nft = new OwnerNft(_song_name);
      owner_nft_contract = address(owner_nft);
      fan_nft_contract = address(fan_nft);
    }




function newOwner(address owner_address ) external {
  owner_nft.transferOwnership(owner_address);
}


}