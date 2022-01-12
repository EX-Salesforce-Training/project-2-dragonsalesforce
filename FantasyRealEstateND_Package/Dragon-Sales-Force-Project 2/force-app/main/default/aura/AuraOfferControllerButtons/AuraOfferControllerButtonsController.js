({
    createOffer : function(component, event, helper) { 
        let createButton = event.getSource().get("v.label");
        component.find("lwcComp").YourFirstFunctionName(createButton);
        
    },
    viewOffers : function(component, event, helper) {
        let viewButton = event.getSource().get("v.label");
        component.find("lwcComp").YourSecondFunctionName(viewButton);
        
    }

})
