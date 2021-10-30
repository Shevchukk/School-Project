import { LightningElement, wire, api } from 'lwc';
import getClasses from '@salesforce/apex/CurClassesHelper.getClasses';


const columns = [
    { label: 'Class Name', fieldName: 'Name', type: 'text' },
    { label: 'Subject', fieldName: 'Subject__c', type: 'text' },
    { label: 'Grade', fieldName: 'Grade__c', type: 'decimal' }
];

export default class BasicDatatable extends LightningElement {
    @api recordId;
    data;
    columns = columns;
    @wire(getClasses, { curRecordId: '$recordId' })
    wiredClasses({ data }) {
        if (data) {
            this.data = [];
            data.forEach(row => {
                let rowData = {};
                if (row.Class__r)
                {
                    rowData.Name = row.Class__r.Name;
                    rowData.Subject__c = row.Class__r.Subject__c;
                }
                rowData.Grade__c = row.Grade__c;
                this.data.push(rowData);
            }) ;
        }
    }
}