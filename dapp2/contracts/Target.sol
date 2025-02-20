// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Target {
    uint256 public data;
    address public updater;

    event DataUpdated(uint256 newData, address sender);

    function updateData(uint256 _newData) public {
        data = _newData;
        updater = msg.sender;
        emit DataUpdated(_newData, msg.sender);
    }

    function getData() public view returns (uint256, address) {
        return (data, updater);
    }
}