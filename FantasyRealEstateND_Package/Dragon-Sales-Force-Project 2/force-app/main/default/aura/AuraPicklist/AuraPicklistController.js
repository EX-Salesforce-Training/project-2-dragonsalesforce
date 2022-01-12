({
    handleChange : function(component, event, helper) {
        var selectedOptionValue = event.getParam("value");
        component.find("lwcComponent").getAuraData(selectedOptionValue);
    },
    
    doInit : function(cmp,evt,hlpr){
        var getPropNames = cmp.get("c.getProperties");
        
        getPropNames.setCallback(this, function(response){
        if(response.getState() === "SUCCESS"){
            cmp.set("v.options", response.getReturnValue());
        }
                                     
        this.propertiesList = [];
        console.log(this.propertiesList);
        if(this.propertiesList[0] == null)
        {
            this.propertiesList = this.propertiesList.concat(response.getReturnValue());
        }
        
        this.propList = []
        
        for (this.i = 0; this.i < this.propertiesList.length; this.i++)
        {
            this.propList.push({value: propertiesList[this.i].Name, label: propertiesList[this.i].Name})
        }
        
        cmp.set("v.picklistOptions", this.propList);
        });
        $A.enqueueAction(getPropNames);
    }
})