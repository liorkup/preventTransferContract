pragma solidity ^0.4.21;

contract MyToken {
  uint256 constant INITIAL_SUPPLY = 200;// * (10 ** uint256(decimals));
  uint256 constant ADMIN_INITIAL_SUPPLY = 100;

  address public constant ADMIN_ADDRESS = 0x000e1cEC4Daa41D45DE7Cd92658f27e2A0A24DE3;

  mapping(address => uint256) balances;

  mapping (address => mapping (address => uint256)) allowed;

  uint256 public totalSupply;

  string public constant name = "MyToken"; // solium-disable-line uppercase
  string public constant symbol = "MTK"; // solium-disable-line uppercase
  uint8 public constant decimals = 18; // solium-disable-line uppercase

  bool public transferAllowed = true;

 /**
  * @dev Constructor that gives msg.sender all of existing tokens.
  */
   function MyToken() public {
     totalSupply = INITIAL_SUPPLY;
     balances[ADMIN_ADDRESS] = ADMIN_INITIAL_SUPPLY;
     balances[msg.sender] = INITIAL_SUPPLY - ADMIN_INITIAL_SUPPLY;
     emit Transfer(0x0, ADMIN_ADDRESS, balances[ADMIN_ADDRESS]);
     emit Transfer(0x0, msg.sender, balances[msg.sender]);
   }

    /**
     * Reviewed:
     * - Interger overflow = OK, checked
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
      require(transferAllowed);
      require(_to != address(0));
      require(_value <= balances[msg.sender]);

      balances[msg.sender] -= _value;
      balances[_to] += _value;
      emit Transfer(msg.sender, _to, _value);
      return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
      require(transferAllowed);
      require(_to != address(0));
      require(_value <= balances[_from]);
      require(_value <= allowed[_from][msg.sender]);

      balances[_from] -= _value;
      balances[_to] += _value;
      allowed[_from][msg.sender] -= _value;
      emit Transfer(_from, _to, _value);
      return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }

    function preventTransfers() public returns (bool success) {
      require(msg.sender == ADMIN_ADDRESS);
      transferAllowed = false;
      return true;
    }

    function allowTransfers() public returns (bool success) {
      require(msg.sender == ADMIN_ADDRESS);
      transferAllowed = true;
      return true;
    }


    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);


}
