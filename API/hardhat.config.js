require('@nomiclabs/hardhat-waffle');

module.exports = {
  solidity: '0.8.1',
  networks: {
    mumbai: {
      url : "https://rpc-mumbai.maticvigil.com/",
      accounts: ["INSERTYOURPRIVATEKEY"],
    },
  },
};
