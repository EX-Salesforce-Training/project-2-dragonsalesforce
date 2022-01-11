({
    handleClick : function (cmp, event, helper) {
        let firstButton = event.getSource().get("v.label")
        cmp.find("lwcComp").nameofyourfunctionLWC(firstButton);
    },
    handleClick2 : function (cmp, event, helper) {
        let secButton = event.getSource().get("v.label");
        cmp.find("lwcComp").nameofsecfunction(secButton);
    }
})
