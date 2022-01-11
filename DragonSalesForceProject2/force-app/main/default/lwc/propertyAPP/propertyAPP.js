import getAllRegions from '@salesforce/apex/propertyAppHelper.getAllRegions';
import getPropertyInfo from '@salesforce/apex/propertyAppHelper.getPropertyInfo';
import { LightningElement,wire,api,track } from 'lwc';

export default class PropertyAPP extends LightningElement {
    @wire(getPropertyInfo) properties;
    @wire(getAllRegions) regiontest;
    @track dataReceived;
    @track bedReceived;
    @track bathReceived;
    @track regionReceived;
    clickedButtonLabel;
    i;
    value = 'inProgress';
    budgetArray = []
    bedArray = []
    bathArray = []
    regionArray = []
    filterArray = []
    filterMode = false
    handleClick2(event){
        this.filterMode = false
    }
    @api receiveAuraData(data){
        this.dataReceived=data;
        
    }
    @api receiveBedData(bedData){
        this.bedReceived=bedData;
        
    }
    @api receiveBathData(bathData){
        this.bathReceived=bathData;
    }
    @api receiveRegionData(regionData){
        this.regionReceived=regionData;
        
    }
    handleClick(event) {
        this.filterMode = true
        this.clickedButtonLabel = event.target.label;
        this.budgetArray=[]
        this.bedArray=[]
        this.bathArray=[]
        this.regionArray=[]
        this.filterArray=[]
        this.filterp1=[]
        this.filterp2=[]
        this.filterp3=[]
        this.filterp4=[]
        this.filterp5=[]
        for(this.i=0;this.i<this.properties.data.length; this.i++){
            if(this.dataReceived!==""){
                console.log('1')
                if(this.dataReceived>=this.properties.data[this.i].Price__c){
                    this.budgetArray.push(this.properties.data[this.i])
                    
                }if(this.dataReceived<this.properties.data[this.i].Price__c){
                    this.budgetArray.push('wrong')
                }
            }if(this.bedReceived!==""){
                console.log('2')
                if(this.bedReceived<=this.properties.data[this.i].Bed__c){
                    this.bedArray.push(this.properties.data[this.i])
                    
                }
                
            }if(this.bathReceived!==""){
                console.log('3')
                if(this.bathReceived<=this.properties.data[this.i].Bath__c){
                    this.bathArray.push(this.properties.data[this.i])
                   
                }
            }if(this.regionReceived!==undefined){
                console.log('4')
                if(this.regionReceived==this.properties.data[this.i].Location__c){
                    this.regionArray.push(this.properties.data[this.i])
                    
                }
            }
        }
        for(this.i=0;this.i<this.properties.data.length; this.i++){
            if(this.budgetArray[0]==null){
                console.log('5')
                this.budgetArray=this.budgetArray.concat(this.properties.data)
            }if(this.bedArray[0]==null){
                console.log('6')
                this.bedArray=this.bedArray.concat(this.properties.data)
            }if(this.bathArray[0]==null){
                console.log('7')
                this.bathArray=this.bathArray.concat(this.properties.data)
            }if(this.regionArray[0]==null){
                console.log('8')
                this.regionArray=this.regionArray.concat(this.properties.data)
            }       
        }
        for(this.j=0;this.j<this.budgetArray.length; this.j++){
            for(this.k=0;this.k<this.regionArray.length; this.k++){
                if(this.regionArray[this.k].Id.includes(this.budgetArray[this.j].Id)){
                    this.filterp1=this.filterp1.concat(this.budgetArray[this.j])
                    console.log(this.filterp1)
                }
            }
        }
        for(this.j=0;this.j<this.budgetArray.length; this.j++){
            for(this.k=0;this.k<this.bedArray.length; this.k++){
                if(this.bedArray[this.k].Id.includes(this.budgetArray[this.j].Id)){
                    this.filterp2=this.filterp2.concat(this.budgetArray[this.j])
                    console.log(this.filterp2)
                }
            }
        }
        for(this.j=0;this.j<this.budgetArray.length; this.j++){
            for(this.k=0;this.k<this.bathArray.length; this.k++){
                if(this.bathArray[this.k].Id.includes(this.budgetArray[this.j].Id)){
                    this.filterp3=this.filterp3.concat(this.budgetArray[this.j])
                    console.log(this.filterp3)
                }
            }
        }
     
        console.log(this.filterp1)
        console.log(this.filterp2)
        console.log(this.filterp3)
        console.log('far')
        for(this.j=0;this.j<this.filterp1.length; this.j++){
            console.log('far2')
            for(this.k=0;this.k<this.filterp2.length; this.k++){
                console.log('far3')
                if(this.filterp2[this.k].Id.includes(this.filterp1[this.j].Id)){
                    this.filterp4=this.filterp4.concat(this.filterp1[this.j])
                    console.log(this.filterp4)
                }
            }
        }
        console.log('far100')
        for(this.j=0;this.j<this.filterp1.length; this.j++){
            for(this.k=0;this.k<this.filterp3.length; this.k++){
                if(this.filterp3[this.k].Id.includes(this.filterp1[this.j].Id)){
                    this.filterp5=this.filterp5.concat(this.filterp1[this.j])
                    console.log(this.filterp5)
                }
            }
        }
        for(this.j=0;this.j<this.filterp4.length; this.j++){
            for(this.k=0;this.k<this.filterp5.length; this.k++){
                if(this.filterp5[this.k].Id.includes(this.filterp4[this.j].Id)){
                    this.filterArray=this.filterArray.concat(this.filterp4[this.j])
                    console.log(this.filterArray)
                }
            }
        }
       // console.log(this.filterp4)
       // console.log(this.filterp5)
        //console.log(this.bathArray)
        //console.log(this.bedArray)
        //console.log(this.budgetArray)
        //console.log(this.regionArray)
        console.log(this.filterArray)
    }
}