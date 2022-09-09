// contracts/State.sol
// SPDX-License-Identifier: Apache 2

pragma solidity ^0.8.0;

import "./CoreRelayerStructs.sol";

abstract contract CoreRelayerStorage {
    struct Provider {
        uint16 chainId;
        uint16 governanceChainId;
        bytes32 governanceContract;
    }

    struct State {
        address payable wormhole;

        Provider provider;

        // Mapping of consumed governance actions
        mapping(bytes32 => bool) consumedGovernanceActions;

        // Mapping of initialized implementations
        mapping(address => bool) initializedImplementations;

        mapping(uint16 => bytes32) registeredContracts;

        //Delivery VAAs which have already been processed
        mapping(bytes32 => bool) completedDeliveries;

        mapping(bytes32 => uint256) relayerRewards;

        address gasOracle;

    }
}

abstract contract CoreRelayerState {
    CoreRelayerStorage.State _state;
}
