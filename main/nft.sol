// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Nft is ERC721 {


        uint32 total_supply;
        uint32 token_id;
        uint32 max_supply;
        uint32 available_supply;
        uint8 max_token_per_address = 1;


    constructor(string memory song_name, uint32 _max_supply) ERC721("FAN_NFT", song_name) {
        max_supply = _max_supply;
        available_supply = _max_supply;
    }



    modifier checkSupply(address user){
        require (available_supply > 0, "sorry not enough supply");
        bool has_minted = super.balanceOf(user) > 0 ? true : false ;
        require(has_minted == false , "you have already minted");
        _;
    }

    function mintToken()  external checkSupply(msg.sender){
        mintToken(msg.sender);
        
    }

    function mintToken(address _to) public checkSupply(_to){
        uint32 tokenId = token_id; //save the value for current id
        token_id+=1;
        available_supply -= 1;
        total_supply += 1;
        super._safeMint(_to, tokenId);
    }
    
    




}