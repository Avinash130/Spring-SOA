import { LightningElement } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import REVENUE_FIELD from '@salesforce/schema/Account.Phone';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import getAccounts from '@salesforce/apex/MostRecentAcctCtrl.getAccounts';

const COLUMNS = [
    { label: 'Account Name', fieldName: NAME_FIELD.fieldApiName, type: 'text'},
    { label: 'Phone', fieldName: PHONE_FIELD.fieldApiName, type: 'phone'},
    { label: 'Annual Revenue', fieldName: REVENUE_FIELD.fieldApiName, type: 'currency'},
    { label: 'Rating', fieldName: RATING_FIELD.fieldApiName, type: 'text'}
];
export default class MostRecentAccounts extends LightningElement {
    columns = COLUMNS;
    @wire(getAccounts)
    accounts;
}