const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const { interface, bytecode } = require('./compile');

const mnemonic = 'pencil number mutual million field occur vivid document salon near only expose';

const provider = new HDWalletProvider(
  mnemonic,
  'https://ropsten.infura.io/X4A2ELvPrPRyyqhvf0dl' // set your infura url
);
const web3 = new Web3(provider);

const deploy = async () => {
  const accounts = await web3.eth.getAccounts();

  console.log('Attempting to deploy from account', accounts[0]);

  const result = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({ data: bytecode, arguments: ['0x000e1cEC4Daa41D45DE7Cd92658f27e2A0A24DE3'] })
    .send({ gas: '1000000', from: accounts[0] });

  console.log('Contract deployed to', result.options.address);
};
deploy();
