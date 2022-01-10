//////////////////////////////////////////////////////////////////////
//
// Name: OfferForm
// Author: Tobi Diaz
// Created: 1/06/21
// Description: JavaScript portion of our offerForm LWC that handles
//              the display of one of our two templates for Offers.
//              Either making an offer, or viewing an offer a user
//              created.
// 
//////////////////////////////////////////////////////////////////////

import { LightningElement, wire, api, track } from 'lwc';
import OFFER_OBJECT from '@salesforce/schema/Offer__c'
import PROPERTY_FIELD from '@salesforce/schema/Offer__c.Property__c'
import OFFER_AMOUNT_FIELD from '@salesforce/schema/Offer__c.Offer_Amount__c'
import BUYER_FIELD from '@salesforce/schema/Offer__c.Potential_Buyer__c'
import PROPERTY_NAME_FIELD from '@salesforce/schema/Offer__c.Property_Field__c'
import OfferHelper from '@salesforce/apex/OfferApexHelper.OfferHelper'

const COLUMNS = [
    {label: 'Property', fieldName: PROPERTY_NAME_FIELD.fieldApiName, type:'text'},
    {label: 'Offer Amount', fieldName: OFFER_AMOUNT_FIELD.fieldApiName, type:'currency'}
]

export default class OfferForm extends LightningElement 
{
    columns = COLUMNS
    objectApiName = OFFER_OBJECT

    fields = [PROPERTY_FIELD, OFFER_AMOUNT_FIELD, BUYER_FIELD]

    @track button1
    @track button2

    button1View = false;
    button2View = false;

    @wire(OfferHelper)
    offers;

    @api
    retrieveButton1Data(button1Data)
    {
        this.button1View = true;
        this.button2View = false;
        this.button1 = button1Data
        console.log(this.offers.data)
    }

    @api
    retrieveButton2Data(button2Data)
    {
        this.button1View = false;
        this.button2View = true;
        this.button2 = button2Data
        console.log(this.button2)
    }

    handleSuccess()
    {
        console.log("Offer Completed.")
    }
}