import { LightningElement } from 'lwc';

export default class DragAndDrop extends LightningElement {
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
} 

