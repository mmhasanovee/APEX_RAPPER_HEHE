import { LightningElement, wire } from 'lwc';
import getClosedCases from '@salesforce/apex/ClosedCasesController.getClosedCases';
import closeSelectedCases from '@salesforce/apex/ClosedCasesController.closeSelectedCases';

export default class ClosedCases extends LightningElement {
    errors;
    cases;
    @wire(getClosedCases)
        wiredCases({error, data}){
            if(data){
                console.log(data);
                this.cases = JSON.parse( JSON.stringify(data) );
                console.log(cases)
            }
            else if(error){
                console.error('Error:', error);
            }
        }
        
    handleClick = event =>{
        event.preventDefault();
        
       //passing the closed cases to the backend 
       closeSelectedCases({
           caseString: JSON.stringify(this.cases)
       })
       .then(result =>{
           console.log('result:', result);
           window.location.reload();
       })
       .catch(error =>{
           console.log('Error is', error);
       })
    }  
    
    handleCheckbox = event =>{
        event.preventDefault();
        let name = event.target.name;
        let checked = event.target.checked;
        let index = event.target.dataset.recordId;
        alert(checked);
        this.cases[index][name] = checked;
    }
}
    
    
