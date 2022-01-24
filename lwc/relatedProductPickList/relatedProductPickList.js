import { LightningElement, api } from 'lwc';

export default class relatedProductPickList extends LightningElement
{
    @api valueString; // Arrives from the Flow
    @api valueChosen; // Goes to the Flow

    picklistOptionValues = []; // Contains the options for the Picklist


    connectedCallback()
    { 
        this.picklistOptionValues[0] = '';
        if(this.valueString){

            var arrayValues = this.valueString.split(';');
            console.log('arrayValues are ' + arrayValues);
            for(var i = 0; i < arrayValues.length; i++)
            {
                console.log('arrayValues[i] are ' + arrayValues[i]);
                this.picklistOptionValues.push(arrayValues[i]);
            
            }

        }
        
    }

    assignValue(event)
    {
        this.valueChosen = event.target.value;
    }

}