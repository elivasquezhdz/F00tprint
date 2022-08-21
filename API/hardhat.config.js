require('@nomiclabs/hardhat-waffle');

module.exports = {
  solidity: '0.8.1',
  networks: {
    mumbai: {
      url : "https://rpc-mumbai.maticvigil.com/",
      accounts: ["8460b6896a7e277acffdb69cd4652922ac7ac3e757cf3b943e83f10b161c7afc"],
    },
  },
};