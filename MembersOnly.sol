// SPDX-License-Identifier: GPL=3.0
pragma solidity ^0.8.0;


/// @title Members Only Smart Contract
/// @author bshellingcodes@gmail.com

contract MembersOnly {
   
   struct Member {
       uint tagId;
       address member;
       uint lastTransaction;
       uint transactionTime;
       address previousOwner;
   }

   address payable private clubOwner;
   int public cards;
   uint public clubPrice;
   Member public member;
   mapping (uint => Member) private members;

   constructor(){
       clubOwner = payable(msg.sender);
       cards = 100;
       clubPrice = 300000000000000000;
   }

   error noMoreMembers(int available);

/*
 * 
*/
   function joinClub(uint tagId) public payable{

       clubOwner.transfer(clubPrice);
       Member storage m = members[tagId];
       m.tagId = tagId;
       m.member = msg.sender;
       m.lastTransaction = clubPrice;
       m.transactionTime = block.timestamp;

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

   function transferMembership(uint tagId, uint amount) public payable {
       
       address payable seller = payable(members[tagId].member);

       clubOwner.transfer(clubPrice/2);
       seller.transfer(amount);
       address previousOwner = members[tagId].member;
       Member storage m = members[tagId];
       m.tagId = tagId;
       m.member = msg.sender;
       m.lastTransaction = clubPrice + amount;
       m.transactionTime = block.timestamp;
       m.previousOwner = previousOwner;

   }

    function getMember(uint tagId) public {
        member = members[tagId];
    }

}