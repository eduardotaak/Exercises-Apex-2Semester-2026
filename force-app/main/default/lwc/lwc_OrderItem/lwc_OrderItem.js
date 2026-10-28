import { LightningElement, api, wire } from 'lwc';
import countOpenCases from '@salesforce/apex/AccountSummaryController.countOpenCases';
import countOpenOpps from '@salesforce/apex/AccountSummaryController.countOpenOpps';
import countWonOpps from '@salesforce/apex/AccountSummaryController.countWonOpps';
import countClosedOpps from '@salesforce/apex/AccountSummaryController.countClosedOpps';

export default class AccountSummary extends LightningElement {
    // Salesforce fills this in with the Id of the account being viewed
    @api recordId;

    // Each @wire calls an Apex method and stores the result in .data
    @wire(countOpenCases, { accountId: '$recordId' }) openCases;
    @wire(countOpenOpps, { accountId: '$recordId' }) openOpps;
    @wire(countWonOpps, { accountId: '$recordId' }) wonOpps;
    @wire(countClosedOpps, { accountId: '$recordId' }) closedOpps;

    // Win rate = won / closed * 100
    get winRate() {
        const won = this.wonOpps.data;
        const closed = this.closedOpps.data;
        if (!closed) return 0;
        return Math.round((won / closed) * 100);
    }
}