pragma solidity ^0.4.0;
 
contract Token {
 // public rend les variables lisibles.
 address public minter;
 mapping (address =&amp;amp;gt; uint) public balances;
 
 //Event permet aux clients de réagir aux changements de façon efficace
 event Sent(address from, address to, uint amount);
 
 // TConstructeur dont le code est executé quand le contrat est lancé
 function Token() {
 minter = msg.sender;
 }
 
 function mint(address receiver, uint amount) {
 if (msg.sender != minter) return;
 balances[receiver] += amount;
 }
 
 function send(address receiver, uint amount) {
 if (balances[msg.sender] &amp;amp;lt; amount) return;
 balances[msg.sender] -= amount;
 balances[receiver] += amount;
 Sent(msg.sender, receiver, amount);
 }
}
