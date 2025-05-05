// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";
import { IERC20 } from  "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BridgeEth is Ownable{
    uint256 balances;
    address public tokenAddress;
    event Deposite(address indexed _from, uint256 _amount);
    mapping(address => uint256) public balance;
    constructor(address _tokenAddress) Ownable(msg.sender){
        tokenAddress = _tokenAddress;
    }

    function lock(uint256 amount, IERC20 _tokenAddress) public{
        require(address(_tokenAddress) == tokenAddress, "Invalid token address");
        require(_tokenAddress.allowance(msg.sender, address(this))>= amount, "Insufficient allowance");
        require(_tokenAddress.transferFrom(msg.sender, address(this), amount));
        emit Deposite(msg.sender, amount);
    }

    function unlock(IERC20  _tokenAddress, uint256 amount) public{
        require(balance[msg.sender]>=amount, "InSufficient balance");
        balance[msg.sender] -= amount;
        _tokenAddress.transfer(msg.sender, amount);
    }

    function BurnedOnOtherSide() onlyOwner public{
        
    }

}