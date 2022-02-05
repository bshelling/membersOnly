// SPDX-License-Identifier: GPL=3.0
pragma solidity ^0.8.0;


/// @title Members Only Smart Contract
/// @author bshellingcodes@gmail.com

contract MembersOnly {
   
   struct Member {
       uint tagId;
       address member;
       unit transaction;

   }

   address private clubOwner;
   int public cards;
   uint public clubPrice;
   address public member;
   mapping (uint => Member) private members;

   constructor(){
       clubOwner = msg.sender;
       cards = 100;
       clubPrice = 1000;
   }

   error noMoreMembers(int available);


/*
 * 
*/
   function joinClub(uint tagId) public {

       Member storage m = members[tagId];
       m.tagId = tagId;
       m.member = msg.sender;
       m.transaction = 300000000000000000;

       if(cards > 0){
           cards -= 1;
       }
       else{
           revert noMoreMembers({
               available: cards
           });
       }
   }

/*

*/

   function transferMembership(address seller, int amount) public {

       

   }

    function getMember(uint tagId) public {
        member = members[tagId];
    }

}