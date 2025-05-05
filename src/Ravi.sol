// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RaviToken is ERC20, Ownable {
    constructor(uint256 supply) ERC20("Ravi", "Rav") Ownable(msg.sender) {
        _mint(msg.sender, supply * 10 ** decimals());
    }

    function mint(address _to, uint256 amount) public{
        _mint(_to, amount);
    }

    function burn(address _to, uint256 amount) public{
        burn(_to, amount);
    }
}
