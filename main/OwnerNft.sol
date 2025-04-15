// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract OwnerNft is ERC721 {
    address public owner;
    uint8 public constant tokenID = 0;
    constructor(string memory song_name,address _owner) ERC721(song_name,"OWNER_NFT") {
        owner = _owner;
        super._mint(owner, tokenID);
    }
 
     modifier onlyOwner() {
        bool allowed = msg.sender == owner || super.getApproved(tokenID) == msg.sender;
        require(allowed,"Only the contract owner can do this");
         _; // executes the contract code in the function body
    }  
    function transferOwnership(address new_owner) public  onlyOwner{
        super._transfer(owner, new_owner, 0);
        owner = new_owner;
    }
    function getOwner() public view returns(address){
        return owner;
    }

}
