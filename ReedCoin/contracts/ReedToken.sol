//contracts/ReedToken.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "ReedCoin/node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "ReedCoin/node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "ReedCoin/node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Reed is ERC20Capped, ERC20Burnable {
    address payable public owner ;
    uint256 public BlockReward;


    constructor(uint256 cap, uint256 reward) ERC20("Reed","REED") ERC20Capped(cap * (10 ** decimals())){
        owner = payable(msg.sender); 
        _mint(owner, 65000000 * (10 ** decimals()));
        BlockReward = reward * (10 ** decimals());
    }

    
    function _mintMinerReward() internal {
        _mint(block.coinbase, blockReward);
    }


    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override{
       if(from != address(0) && to !=block.coinbase && block.coinbase != adress(0)){
        _mintMinerReward();
       }
       spuer._beforeTokenTransfer(from,to,value);
        
    }


    function SetBlockReward(unit256 reward) public onlyOwner{
        
        BlockReward = reward * (10** decimals());

    }

    function destroy() public onlyOwner{
        selfdestruct(owner);
    }    

    modifier onlyOwner{
        require(msg.sender == owner, "Only the owner can call this function " );
        _;
    }

}
