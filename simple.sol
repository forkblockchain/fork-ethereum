pragma solidity ^0.4.18;

contract Simple {
  event MultiplyLog(
      address _from,
      uint _a,
      uint _b,
      uint _result);

  function arithmetics(uint _a, uint _b) public pure returns (uint o_sum, uint o_product) {
    o_sum = _a + _b;
    o_product = _a * _b;
  }

  function multiply(uint _a, uint _b) public returns (uint o_product) {
    o_product = _a * _b;
    MultiplyLog(msg.sender,_a,_b,o_product);
    return;
  }
}

