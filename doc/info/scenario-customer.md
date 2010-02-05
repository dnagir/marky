Title: Marky project - customer use-cases
CSS: style.css

Scenarios - Customer
====================



Confirm order change
-----------------------------------------
The customer *might* receive a notification about changes to his order.
The notification asks to confirm the order changes and provides the reasons.

So the customer clicks a link from email and:
1. Opens a page with order details.
2. Customer chooses one of options:
  1. Confirm.
  2. Clarify.
3. If 'Confirm' is selected then the customer receives automated notification about the confirmation.
4. If 'Clarify', then customer should leave a comment and proceed.
5. Then user goes to Account page.



View/change user details
-----------------------------------------
Customer can view/change his details. That includes (*optional*):
- *Title*
- First name and last name
- Email address


Place an order
-----------------------------------------
(*Pretty much the same steps as a Visitor does, except no contact information*)
On the Order form:
  1. Work request: work type (optional - "I am not sure or custom"), *short description*, full description, *attached photo*.
  2. Do you want to add another photo? (if yes go to 2).
  3. Confirm the order.
  4. Customer goes to the Account page.
  5. Customer receives a confirmation notification.


Pay for the work {#payment}
-----------------------------------------
Customer receives a notification re: job has been done and can pay for it.

1. Customer goes to the order details page (from link in email);
2. if the order has NO outstanding amount, nothing to do;
3. customer clicks the "Pay" link;
4. system redirects the customer to external payment provider (PayPal or other);
5. customer pays on that site on-line;
6. customer returns to the customer home page;
7. customer clicks on the needed order;
8. customer can download all the necessary files included into order;



Download the work results
-----------------------------------------
Requires a [payment](#payment) to be made.



Receive a notifications about the work progress
-----------------------------------------
When status of the order is changed a Customer should receive notifications.

