import { LightningElement,wire } from 'lwc';
import getacc from '@salesforce/apex/acccController.getacc';


columns = [{
    label: 'Account name',
    fieldName: Name,
    type: 'text',
    sortable: true
},
{
    label: 'Type',
    fieldName: Type,
    type: 'text',
    sortable: true
},
{
    label: 'Annual Revenue',
    fieldName: 'AnnualRevenue',
    type: 'Currency',
    sortable: true
}]

export default class PraticeDatatable1 extends LightningElement {
   acclst;
   error;
    columns = columns;
 @wire (getacc) getRec ({error,data})

 {
    if(data){
    this.acclst =data;
    }else if(error){
        this.error =error;
    }
 }  
           

}