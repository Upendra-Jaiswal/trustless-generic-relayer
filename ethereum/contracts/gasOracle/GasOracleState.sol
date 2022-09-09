// contracts/State.sol
// SPDX-License-Identifier: Apache 2

pragma solidity ^0.8.0;

import "./GasOracleStructs.sol";


abstract contract GasOracleStorage {
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

        // The address allowed to update price infos
        address approvedUpdater;

        mapping(uint16 => GasOracleStructs.PriceInfo) priceInfos;
    }
}

abstract contract GasOracleState {
    GasOracleStorage.State _state;
}
