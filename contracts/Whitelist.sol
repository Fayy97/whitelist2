//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    // max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // create a mapping of whitelistedAddresses
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.abi

    mapping(address => bool) public whitelistedAddresses;

    // numberAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    // NOTE: Don't chsnge this variable name, as it will be part of verification
    uint8 public numAddressesWhitelisted;

    // setting the max number of whitelisted addresses
    // User will put the value at the time of dployement
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /*
  addAddressesToWhitelist - This function adds the address of the sender to the whitelist
  */
    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );

        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.abi
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "more addresses can't be added, limit reached"
        );

        // Add the address which called the function to the whitelisted array
        whitelistedAddresses[msg.sender] = true;

        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}