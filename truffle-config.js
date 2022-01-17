module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  solc: {
    version: '0.5.16'
  },
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "1337" // use "*" to match any network id 
    },
    ropsten: {
      url: `https://ropsten.infura.io/v3/${process.env.ROPSTEN_API_KEY}`,
      accounts: [`0x${process.env.REACT_APP_PRIVATE_KEY}`]
    },
    matic: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [`0x${process.env.REACT_APP_PRIVATE_KEY}`]
    },
    fuji: {
      url: 'https://api.avax-test.network/ext/bc/C/rpc',
      gasPrice: 225000000000,
      chainId: 43113,
      accounts: [`0x${process.env.REACT_APP_PRIVATE_KEY}`]
    },
    develop: {
      port: 8545
    }
  }
};
