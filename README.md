# Fantasy Real Estate

## Project Description
  An experience cloud site using the Salesforce platform which allows users view, post, and submit offers
  on properties from fantasy domiciles in popular books/movies/tv shows/video games. 
  

## Technologies Used
Aura Components
LWC Components
Apex Triggers & Classes
Package based development

## Features

-Users can use a filter function to limit the properties returned by Asking Price, Bedrooms, Bathrooms and Region.
-Users can also select the name of a property of interest from a combobox to display important property info
  (Address, Region, Bedrooms, Bathrooms, Asking Price) As well as pick any of the URL Images associated with the
  property and view it in a larger format.
-Users are able to post their own property to the site as an opportunity, through LDS, containing all of the relevant 
  information, when that opportunity is approved, it will be shown in the filter and display area of the experience cloud site,
  with a button click, the user can switch from a submission form to a datatable view that shows all opportunities the
  user has created.
 -The user can submit an offer on a property, using LDS again, and click a button to switch to another Datatable
  view, which will display all offers the user has made.
  
### Included but not shown on the experience cloud site:
  When a property's bidding status becomes "Closed Sold," an archive property record is created using the property details,
  the property is deleted, and the realtor earns commission based on a percentage of the accepted bid.

### To-do list:
- The experience cloud site should be accessible to end-users, not only the org administrator. 
  Security changes should be made so portal users can view object records when logged in.
- A new filter should be implemented to allow a user to view offers that have been made on properties they submitted.

## Getting Started
https://github.com/EX-Salesforce-Training/project-2-dragonsalesforce.git

Create a new Salesforce production org, use the following links to install required packages, 
starting with the Core Package, then any order:

### Core Package:
https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5f000000S8bkAAC

### Nick de Sousa's Package:
https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5f000000WDnPAAW

### Elizabeth Mohan's Package:
https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5f000000rG9sAAE

### Tobi Diaz' Package:
https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5f0000004FViAAM

### Andrew Emond's Package:
https://revature-11f-dev-ed.my.salesforce.com/packaging/installPackage.apexp?p0=04t5f0000006zwqAAA

Create a new Experience cloud site, deploy the Filter, AuraPicklist, OppAura, and OfferForm components on to the page as such: 
![image](https://user-images.githubusercontent.com/93998652/149240116-cb91d454-5f99-4763-8f3d-5bddc3144c6b.png)


Properties created in the Property__c tab will be displayed directly onto the site. 
If you use the component to "Submit Interest in Selling," you must go to the Opportunities tab and change the Stage to Closed Won. Refresh the site and it will appear as a property. (All URLs associated with a property will need to be allowed in the experience cloud Security Settings after reducing the strictness of the security)
You may filter all properties by either Price, Bedrooms, Bathrooms, or Location.
![image](https://user-images.githubusercontent.com/93998652/149240556-128b4791-f887-403d-925a-0df4d01a73ba.png)

You may select a property to view and cycle through its associated images.
![image](https://user-images.githubusercontent.com/93998652/149241482-e5a71722-8196-4e4d-a1a3-459fcc8e7cb2.png)

## Contributors
Nick de Sousa
Andrew Emond
Tobi Diaz
Elizabeth Mohan
