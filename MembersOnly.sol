// SPDX-License-Identifier: GPL=3.0
pragma solidity ^0.8.0;

/// @title Members Only Smart Contract
/// @author bshellingcodes@gmail.com
/// @notice Members Only Smart Contract's functionality enables users to join a club with the purchase of a membership from the limited supply. A membership can be sold and transferred to the a new member.
/// @notice All public variables and functions are for testing purposes

contract MembersOnly {
   
   struct Member {
       uint membershipId;
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

   /// Events
   event Join(address _newMember, uint joinDate);
   event Transfer(address _newMember,address _oldMember, uint transferDate);
   event Available(uint memberships);

/// @notice Returns availabe memberships 
   error noMoreMembers(int available);

/// Join Club `membershipId`
/// @param membershipId
/// @notice New member pays club price to join. No memberships can be purchased if the cards value is 0
   function joinClub(uint membershipId) public payable{

       clubOwner.transfer(clubPrice);
       Member storage m = members[membershipId];
       m.membershipId = membershipId;
       m.member = msg.sender;
       m.lastTransaction = clubPrice;
       m.transactionTime = block.timestamp;

       if(cards > 0){
           cards -= 1;
           emit Join(msg.sender, block.timestamp);
       }
       else{
           revert noMoreMembers({
               taken: members.length
           });
           emit Available(members.length);
       }

   }

/// Transfer Membership `membershipId` & 'amount`
/// @param membershipId
/// @notice Memberships can be purchase by users that are not already members. The new member must agree to the seller's price. If agreed the new member must pay the amount plus 15% of the club price
   function transferMembership(uint membershipId, uint amount) public payable {
       
       address payable seller = payable(members[membershipId].member);
       clubOwner.transfer(clubPrice/2);
       seller.transfer(amount);
       address previousOwner = members[membershipId].member;
       Member storage m = members[membershipId];
       m.membershipId = membershipId;
       m.member = msg.sender;
       m.lastTransaction = clubPrice + amount;
       m.transactionTime = block.timestamp;
       m.previousOwner = previousOwner;
       emit Transfer(msg.sender, previousOwner, block.timestamp);

   }

/// Get Member `membershipId``
/// @param membershipId
/// @notice Identifies the current membership
    function getMember(uint membershipId) public {
        member = members[membershipId];
    }

}