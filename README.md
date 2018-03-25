# MyToken contract

MyToken is a simple ERC20 contract  with prevent & allow transfers methods.

### Prerequisites

nodeJS
npm


### Installing
```
npm install
```

## Deployment
change mnemonic to your personal account
change infura adress to your designated URL for ropsten

deploy.js:
```
const mnemonic = 'pencil ...';

const provider = new HDWalletProvider(
  mnemonic,
  'https://ropsten.infura.io/X4A2ELvPrPRyyqhvf0dl' // set your infura url
);
```

run:
```
node deploy.js
```

## Specification

#### MyToken Cont'r

Define Admin's address.
Grants initial 100 tokens in your and Admin's accounts.


``` js
function MyToken(address _addr) public
```


#### totalSupply

Returns the total token supply.

``` js
function totalSupply() view returns (uint256 totalSupply)
```



#### balanceOf

Returns the account balance of another account with address `_owner`.

``` js
function balanceOf(address _owner) view returns (uint256 balance)
```



#### transfer

Transfers `_value` amount of tokens to address `_to`

``` js
function transfer(address _to, uint256 _value) returns (bool success)
```



#### transferFrom

Transfers `_value` amount of tokens from address `_from` to address `_to`,
Transfer will happen only if _to  approved to your account  to withdraw `_value` or more.
``` js
function transferFrom(address _from, address _to, uint256 _value) returns (bool success)
``` 


#### approve

Allows `_spender` to withdraw from your account multiple times, up to the `_value` amount. If this function is called again it overwrites the current allowance with `_value`.


``` js
function approve(address _spender, uint256 _value) returns (bool success)
```


#### allowance

Returns the amount which `_spender` is still allowed to withdraw from `_owner`.

``` js
function allowance(address _owner, address _spender) view returns (uint256 remaining)
```




#### preventTransfers

Prevents any future transfers.

``` js
function preventTransfers() public returns (bool success)
```


#### allowTransfers

Allows future transfers. Can be used by Admin only.

``` js
function preventTransfers() public returns (bool success)
```



## Usage

* Deploy contract with wanted Admin account.
* Users can interact with contract and transfer tokens by using `transfer` and `transferFtom` methods.
* Users can allow others to withdraw tokens from their account using `allowance` method.
* Admin can use `preventTransfer` and `allowTransfers` methods to control the abilty of users to transfer tokens.

## Author

**Lior Kupfer**
