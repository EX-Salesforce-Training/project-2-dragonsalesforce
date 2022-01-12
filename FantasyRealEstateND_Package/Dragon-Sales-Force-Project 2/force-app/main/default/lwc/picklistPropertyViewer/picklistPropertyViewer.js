import { LightningElement, wire, track, api } from 'lwc';
import getPropertyFields from '@salesforce/apex/PicklistViewerGetFields.getPropertyFields';

export default class PicklistPropertyViewer extends LightningElement {
    noImageURL = "https://media2.giphy.com/media/blJgSNwnpYREqIdIPT/giphy.gif?cid=790b7611402d7c46595747a5190fb030213253d99ff7b3be&rid=giphy.gif&ct=g";
    url1 = "https://media2.giphy.com/media/blJgSNwnpYREqIdIPT/giphy.gif?cid=790b7611402d7c46595747a5190fb030213253d99ff7b3be&rid=giphy.gif&ct=g";
    url2 = "https://media2.giphy.com/media/blJgSNwnpYREqIdIPT/giphy.gif?cid=790b7611402d7c46595747a5190fb030213253d99ff7b3be&rid=giphy.gif&ct=g";
    url3 = "https://media2.giphy.com/media/blJgSNwnpYREqIdIPT/giphy.gif?cid=790b7611402d7c46595747a5190fb030213253d99ff7b3be&rid=giphy.gif&ct=g";
    url4 = "https://media2.giphy.com/media/blJgSNwnpYREqIdIPT/giphy.gif?cid=790b7611402d7c46595747a5190fb030213253d99ff7b3be&rid=giphy.gif&ct=g";
    url5 = "https://media2.giphy.com/media/blJgSNwnpYREqIdIPT/giphy.gif?cid=790b7611402d7c46595747a5190fb030213253d99ff7b3be&rid=giphy.gif&ct=g";
    bigUrl = this.url1;
    
    @wire(getPropertyFields)
    propertyFieldList;
    
    region = "Region";
    address = "Address";
    beds = "Beds";
    baths = "Baths";
    price = "Asking Price";
    
    @track 
    picklistReceiver;
    @api
    getAuraData(data){
        this.picklistReceiver = data;
        
        
        for(i = 0; i < this.propertyFieldList.data.length; i++){
            this.bigUrl = this.noImageURL;
            if(this.propertyFieldList.data[i].Name == this.picklistReceiver){
                this.region = "Region: " + this.propertyFieldList.data[i].Location__c;
                this.address = "Address: " + this.propertyFieldList.data[i].Address__c;
                this.beds = "Beds: " + this.propertyFieldList.data[i].Bed__c;
                this.baths = "Baths: " + this.propertyFieldList.data[i].Bath__c;
                this.price = "Asking Price: $" + this.propertyFieldList.data[i].Price__c;
                if(this.propertyFieldList.data[i].Picture_1__c != null){
                    this.url1 = this.propertyFieldList.data[i].Picture_1__c;
                }
                else{
                    this.url1 = this.noImageURL;
                }
                if(this.propertyFieldList.data[i].Picture_2__c != null){
                    this.url2 = this.propertyFieldList.data[i].Picture_2__c;
                }
                else{
                    this.url2 = this.noImageURL;
                }
                if(this.propertyFieldList.data[i].Picture_3__c != null){
                    this.url3 = this.propertyFieldList.data[i].Picture_3__c;
                }
                else{
                    this.url3 = this.noImageURL;
                }
                if(this.propertyFieldList.data[i].Picture_4__c != null){
                    this.url4 = this.propertyFieldList.data[i].Picture_4__c;
                }
                else{
                    this.url4 = this.noImageURL;
                }
                if(this.propertyFieldList.data[i].Picture_5__c != null){
                this.url5 = this.propertyFieldList.data[i].Picture_5__c;
                }
                else{
                    this.url5 = this.noImageURL;
                }
            }
        }   
    }

    pic1Click(){
        this.bigUrl = this.url1;
    }
    pic2Click(){
        this.bigUrl = this.url2;
    }
    pic3Click(){
        this.bigUrl = this.url3;
    }
    pic4Click(){
        this.bigUrl = this.url4;
    }
    pic5Click(){
        this.bigUrl = this.url5;
    }
}