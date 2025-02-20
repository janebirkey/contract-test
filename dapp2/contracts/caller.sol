// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "./Target.sol";

contract Caller {
    Target public targetContract;

    constructor(address _targetAddress) {
        targetContract = Target(_targetAddress);
    }

    function callUpdateData(uint256 _newData) public {
        // 1. 使用 abi.encodeWithSignature 构建函数调用数据
        bytes memory callData = abi.encodeWithSignature("updateData(uint256)", _newData);

        // 2. 使用 address.call 进行底层调用
        (bool success, ) = address(targetContract).call(callData);

        // 3. 检查调用是否成功
        require(success, "Call to updateData failed");

        // 可选：处理返回值 (returnData)，这里 Target.updateData 没有返回值，所以 returnData 会是空的。
    }

    // 辅助函数：直接调用目标合约，用于对比
    function directCallUpdateData(uint256 _newData) public {
        targetContract.updateData(_newData);
    }
}