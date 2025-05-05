// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WRaviToken is ERC20, Ownable {
    constructor(uint256 supply) ERC20("Wrapped Ravi", "WRav") Ownable(msg.sender) {
        _mint(msg.sender, supply * 10 ** decimals());
    }

    function mint(address _to, uint256 _amount) public {
        _mint(_to, _amount);
    }

    function burn(address _from, uint256 _amount) public{
        burn(_from, _amount);
    }
    
}