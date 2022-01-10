//////////////////////////////////////////////////////////////////////
//
// Name: OfferFormAuraController
// Author: Tobi Diaz
// Created: 1/06/21
// Description: A JavaScript controller for our Offer Form. We create
//              two functions: one that exposes our form for creating
//              an offer, another that exposes our form for viewing
//              an offer. Both functions communicate with the function
//              in the LWC offerForm to achieve this.
// 
//////////////////////////////////////////////////////////////////////

({
    createOffer : function(component, event, helper) { 
        let createButton = event.getSource().get("v.label");
        component.find("lwcComp").retrieveButton1Data(createButton);
    },
    viewOffers : function(component, event, helper) {
        let viewButton = event.getSource().get("v.label");
        component.find("lwcComp").retrieveButton2Data(viewButton);
    }
})