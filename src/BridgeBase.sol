// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import { IERC20 } from  "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IBUSDT is IERC20 {
    function mint(address _to, uint256 _amount) external;
    function burn(address _from, uint256 _amount) external;
}


contract BridgeBase is Ownable{
    uint256 balances;
    address public tokenAddress;

    mapping(address => uint256) public balance;
    constructor(address _tokenAddress) Ownable(msg.sender){
        tokenAddress = _tokenAddress;
    }

    function mint(IBUSDT _tokenAddress, uint amount) public{
       require(balance[msg.sender]>=amount, "InSufficient balance");
       balance[msg.sender] -= amount;
        _tokenAddress.mint(msg.sender, amount);
    }   

    function burn(IBUSDT _tokenAddress, uint amount) public{
        require(balance[msg.sender]>=amount, "InSufficient balance");
        balance[msg.sender] -= amount;
        _tokenAddress.burn(msg.sender, amount);
    }

    function DepositeOnOtherSide() onlyOwner public{

    }
}

