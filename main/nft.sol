// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract OwnerNft is ERC721  {
    address public owner;

    constructor(string memory song_name) ERC721("OWNER_NFT",song_name){
        owner = msg.sender;
        super._mint(owner, 0);
    }
 
     modifier onlyOwner() {
        require(msg.sender == owner, "only owners can mint");
        _; // executes the contract code in the function body
    }  

    function transferOwnership(address new_owner) external onlyOwner{
        super._transfer(owner, new_owner, 0);
        owner = new_owner;
    }


}

contract FanNft  is ERC721 {


        uint32 public  total_supply;
        uint32 token_id;
        uint32 public  max_supply;
        uint32 public available_supply;
        uint8 max_token_per_address = 1;
        bool lock = false;


    constructor(string memory song_name, uint32 _max_supply) ERC721("FAN_NFT", song_name) {
        max_supply = _max_supply;
        available_supply = _max_supply;
    }



    modifier checkSupply(address user){
        require(!lock,"sorry someone else is minting now, please try again later");
        lock = true; // to avoid security bugs
        require (available_supply > 0, "sorry not enough supply");
        bool has_minted = super.balanceOf(user) > 0 ? true : false ;
        require(has_minted == false , "you have already minted");
        _;
        lock = false;
    }

    function mintToken()  external {
        mintToken(msg.sender);
        
    }

    function mintToken(address _to) public checkSupply(_to){
        super._safeMint(_to, token_id);
        token_id+=1;
        available_supply -= 1;
        total_supply += 1;
    }
    
    
}

contract NftFactory is OwnerNft , FanNft {
string public song_name;
uint32 maxSupply =0 ;

constructor(string memory _song_name, uint32 supply) 
    OwnerNft(_song_name)
   FanNft(_song_name,supply){
      song_name=_song_name;

maxSupply=supply; // initialize the variable
}
 

function newOwner(address owner_address ) external {
  transferOwnership(owner_address);
}

 function getFanToken() public returns (uint256) { 
 return token_id;
 }

 }