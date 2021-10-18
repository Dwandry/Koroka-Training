import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/dragAndDropController.getAccounts';

export default class DragAndDrop extends LightningElement {

    @track accounts;
    @track error;

    @wire(getAccounts)
    wiredAccounts({data,error}){
        if(data){
            this.accounts = data;
            this.error = undefined;
        }else{
            this.accounts = undefined;
            this.error = error;
        }
    }

    dragStart(event){
        event.dataTransfer.setData("elementId", event.target.id);        
    }

    allowDrop(event){
        event.preventDefault();
    }
    
    dropFirst(event){
        event.preventDefault();
        let elementId = event.dataTransfer.getData("elementId");        
        
        let draggedElement = this.template.querySelector('#' + elementId);
       
        draggedElement.classList.remove('draggable-style-second-container');
        draggedElement.classList.add('draggable-style-first-container'); 
        event.target.appendChild(draggedElement);
    }

    dropSecond(event){
        event.preventDefault();
        let elementId = event.dataTransfer.getData("elementId");
        
        let draggedElement = this.template.querySelector('#' + elementId);
       
        draggedElement.classList.remove('draggable-style-first-container');
        draggedElement.classList.add('draggable-style-second-container'); 
        event.target.appendChild(draggedElement);
    }
    removeElement(event){        
        let spanId = event.target.id;        
        let spanElement = this.template.querySelector('#' + spanId);       
        spanElement.remove();
    }
} 

