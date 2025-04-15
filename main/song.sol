// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./OwnerNft.sol";
import "./FanNft.sol";
import "./CopyRightNft.sol";




contract Song{

//address songs_contract_address = 

// to_do security that no another song has the same id




uint   public song_id;
string public song_name;
string public styles;
string public negativ_styels;
string public uri;
uint32 public fan_nft_maxSupply =0 ;
OwnerNft owner_nft;
FanNft fan_nft;
CopyRightNft copyright_nft;
address public owner_nft_contract;
address public fan_nft_contract;



constructor(uint _song_id,string memory _song_name, uint32 fan_nft_supply,uint32 _copyright_nft_supply,uint _copyright_nft_price, string memory _styles, string memory _negativ_styels,string memory _uri) 
    {
      song_id = _song_id;
      song_name = _song_name;
      styles = _styles;
      negativ_styels = _negativ_styels;
      uri= _uri;
      fan_nft_maxSupply = fan_nft_supply; 
      fan_nft   = new FanNft(song_name,fan_nft_supply); // Erstellung eines neuen Contracts
      owner_nft = new OwnerNft(_song_name);
      copyright_nft = new CopyRightNft(_song_name,_copyright_nft_supply,_copyright_nft_price, address(owner_nft));
      owner_nft_contract = address(owner_nft);
      fan_nft_contract = address(fan_nft);

    }




function newOwner(address owner_address ) external {
  owner_nft.transferOwnership(owner_address);
}


}