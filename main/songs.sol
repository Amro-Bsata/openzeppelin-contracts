// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./OwnerNft.sol";
import "./FanNft.sol";
import "./CopyRightNft.sol";

contract Songs {

 struct song {
        uint32   song_id; 
        string song_name;
        string styles;
        string negativ_styels;
        string uri;
        uint32 fan_nft_maxSupply;
        uint32 copyright_nft_maxSupply;
        uint copyright_nft_price;
        address owner_nft_contract;
        address fan_nft_contract;
        address copyright_nft_contract;
        address owner;
    }

    uint32 public next_song_id = 0;

    mapping(uint32 => song) public songs;




    constructor(){
    }


    function create_song(string memory song_name,string memory styles, string memory negativ_styels , string memory uri,
    uint32 fan_nft_maxSupply,uint32 copyright_nft_maxSupply,uint copyright_nft_price) public {
        OwnerNft owner_nft = new OwnerNft(song_name);
        FanNft fan_nft =  new FanNft(song_name,fan_nft_maxSupply); // Erstellung eines neuen Contracts;
        CopyRightNft copyright_nft = new CopyRightNft(song_name,copyright_nft_maxSupply,copyright_nft_price, address(owner_nft));

        song memory new_song = song(next_song_id, song_name, styles, negativ_styels,uri, fan_nft_maxSupply,copyright_nft_maxSupply,
        copyright_nft_price,address(owner_nft),address(fan_nft),address(copyright_nft),address(msg.sender));
        songs[next_song_id] =  new_song;
        next_song_id+=1;


    }

    function get_song(uint32 song_id) public view returns (song memory) {
             return songs[song_id];
        }
    
    
}

