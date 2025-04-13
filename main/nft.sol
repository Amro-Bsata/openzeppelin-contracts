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


constructor(string memory _song_name, uint32 supply,address _owner_nft_contract,address _fan_nft_contract) 
    {
      song_name = _song_name;
      maxSupply = supply; 
      fan_nft   = new FanNft(song_name,supply);
      owner_nft = new OwnerNft(_song_name);
      owner_nft_contract = _owner_nft_contract;
      fan_nft_contract = _fan_nft_contract;
    }





function newOwner(address owner_address ) external {
  
  OwnerNft(owner_nft_contract).transferOwnership(owner_address);
}


}