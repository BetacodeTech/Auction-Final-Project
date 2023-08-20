# Auction-Final-Project

This project serves as the culminating assignment for the blockchain course. It features a simple HTML interface for interacting with smart contracts, along with a solidity smart contract deployed using [remix IDE](https://remix.ethereum.org/).

## Prerequisites

1. **MetaMask Extension**: Before getting started, ensure you have the MetaMask extension installed in your browser. If not, you can get it [here](https://metamask.io/download.html).
2. **Node.js**: Ensure you have Node.js installed on your system. You can download and install it from [nodejs.org](https://nodejs.org/).

## Getting Started

### Setting Up MetaMask

1. Create a new account on MetaMask. This is solely for testing purposes.
2. Ensure that the Sepolia testnet is configured in your MetaMask settings.
3. Visit the [Sepolia Faucet](https://sepoliafaucet.com/) to inject test ETH into your account.
4. Connect with [remix IDE](https://remix.ethereum.org/) to the MetaMask testnet and verify that your account has been credited with ETH.

### Deploying the Smart Contract

1. On remix IDE, create and deploy the `auction.sol` smart contract.
2. Interact with the deployed contract on remix IDE to ensure it's functioning correctly.

### Running the Local Server

1. Open your command prompt or terminal.
2. Install the http-server globally using the command:

```
    npm install http-server -g
```

3. Navigate to the specific directory containing your project files and run the following command:

```
    http-server
```

4. Once the server is running, open your browser and visit `localhost:8080`.

### Interaction

- Engage with the deployed contract using the provided HTML interface.
- Encourage other students to interact with it as well for a comprehensive testing experience.

## Conclusion

Congratulations on setting up and testing your Auction-Final-Project! We hope this serves as a valuable learning experience in blockchain and smart contract development.
