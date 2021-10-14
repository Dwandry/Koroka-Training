import { LightningElement } from 'lwc';

export default class DragAndDrop extends LightningElement {
    dragStart(event){
        event.dataTransfer.setData("elementId", event.target.id);
    }

    allowDrop(event){
        event.preventDefault();
    }
    
    drop(event){
        event.preventDefault();
        let elementId = event.dataTransfer.getData("elementId");
        let draggedElement = this.template.querySelector('#' + elementId);
        event.target.appendChild(draggedElement);
    }
} 

