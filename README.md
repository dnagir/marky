Marky - application to support image processing business
========================================================


Main scenarios
========================================================

*Visitor* can view job samples
---------------------------------
1. *Visitor* goes to Samples page;
2. system shows a list of samples;
  - thumbnail of *before* and *after* images
  - Short description
  - is categorised by *Work type*
3. user click one of samples and following information appears:
  - two images in their original size;
  - description of the work being done;
  - the cost.

*Visitor* can gather information about the potential work request
--------------------------------------------------------------
Any *Visitor* can navigate to the following pages:

- Home
- Contact (*Owner* name, phone number, email)
- Samples
- Terms & Conditions
- Privacy Statement
- Order form (Visitor provides enough details to become a customer and put an order)



*Visitor* can place an order
-----------------------------------------
On the Order form (Visitor provides enough details to **become a customer** and put an order):

1. Contact information (Title, *First name*, *last name*, company name, *email*, phone, *password*).
2. Work request: work type (optional - "I am not sure or custom"), *short description*, full description, *attached photo*.
3. Do you want to add another photo? (if yes go to 2).
4. Confirm the order.
5. Customer goes to the Account page.
6. Customer receives a confirmation notification.


*Customer* places an order
-----------------------------------------
(*Pretty much the same steps as a Visitor does, except no contact information*)
On the Order form:

1. Work request: work type (optional - "I am not sure or custom"), *short description*, full description, *attached photo*.
2. Do you want to add another photo? (if yes go to 2).
3. Confirm the order.
4. Customer goes to the Account page.
5. Customer receives a confirmation notification.


*Customer* can confirm order change
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


*Customer* should pay for the work
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


*Customer* should be able to download the work results
-----------------------------------------
Requires a payment to be made.


*Customer* receives a notifications about the work progress
-----------------------------------------
When status of the order is changed a Customer should receive notifications.


Glossary
====================

*Visitor:*
> A person browsing a web site who has not yet been registered.

*Customer:*
> A person registered on the web site who can log in and request a job to be done.

*Owner:*
> The owner of the web site who is responsible for the job to be done and receives the payments.

*Order:*
> The files required for the Job and amount to be paid for that.
> Contains all the jobs related to the given order.

*Order status:*
> The status of the order: Initial, Pending, In Progress, Completed, Published.


*Turnaround time:*
> Amount from placing the order to the *preview*.


*Preview:*
> Ready image protected by watermarks so that it becomes unusable as an end result.


*Job:*
> The Job needed to be done by the *Owner*.


*Job type:*
> Describes the logical type of Job that should be done.
> It includes: Price of the given type of Job; Description of the Job: Restoration, Enhancement, Corrections, Manipulation.


*Payment:*
> Receipt of money from a *customer* given to the *Owner*.


*Payment type:*
> Different types of payment: Paypal, Cash, Bank Cheque.


*Payment acknowledgement:*
> Advise to the *customer* that a payment has been received via automated email.


*Job request:*
> A request of the Job made to the *Owner* by a *Customer*.


*Job result:*
> The set of assets produced as a result of a *Job request*.


*Sample:*
> Example of a *Job request* and a *Job result* that shows the quality of the work.
> Intended to attract *Visitors*.







The project dependencies
=========================

Production dependencies
-----------------------
- mysql
- `inherited_resources (http://github.com/josevalim/inherited_resources)`, depends on `responders`  plugin
- Paperclip: better install from source *script/plugin install git://github.com/thoughtbot/paperclip.git*
- HAML
- formtastic + ValidationReflection (http://github.com/redinger/validation_reflection)
- CanCan
- Authlogic + authlogic_openid




Development dependencies
------------------------
- mocha
- shoulda

Additionally useful:
- ZenTest (for autotest)
- autotest-notification
- autotest-rails





License
================================
*TO BE DONE*

Parts of the code can be used in different applications but should not be deployed to production
servers for commercial purposes, in order to avoid competition the owner of this web site.

