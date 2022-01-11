({
    passDataToLWC  : function(component, event, helper) {
		let budgetString = component.find("budget").get("v.value");
        let bedString = component.find("bedrooms").get("v.value");
        let bathString = component.find("bathrooms").get("v.value");
        component.find("lwcComp").receiveAuraData(budgetString);
        component.find("lwcComp").receiveBedData(bedString);
        component.find("lwcComp").receiveBathData(bathString);
	},
    handleChange: function (component, event) {
        var selectedOptionValue = event.getParam("value");
        component.find("lwcComp").receiveRegionData(selectedOptionValue);
    },
    doInit : function(component, event, helper){
        let getAuraRegions = component.get("c.getAllRegions")
        getAuraRegions.setCallback(this, function(response){
            if(response.getState()==="SUCCESS"){
                component.set("v.regions", response.getReturnValue());
                this.regionList= []
                if(this.regionList[0]==null){
                    this.regionList=this.regionList.concat(response.getReturnValue())

                }
                this.cOptions= []
                for(this.i=0;this.i<this.regionList.length;this.i++){
                    if(this.cOptions.includes({value: regionList[this.i].Location__c, label:regionList[this.i].Location__c })=== false){
                        this.cOptions.push({value: regionList[this.i].Location__c, label:regionList[this.i].Location__c })
                    }
                }
                component.set("v.comOptions", this.cOptions);
            }
        });
        $A.enqueueAction(getAuraRegions);
    },
    

})
