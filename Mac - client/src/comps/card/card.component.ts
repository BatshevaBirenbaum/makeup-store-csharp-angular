import { Component, Input, Output ,EventEmitter} from '@angular/core';
import { ButtonComponent } from '../button/button.component';
import { DescriptionPipe } from '../../app/description.pipe';

@Component({
  selector: 'app-card',
  standalone: true,
  imports: [ButtonComponent,DescriptionPipe],
  templateUrl: './card.component.html',
  styleUrl: './card.component.css'
})
//קומפננטת בן למבנה קבוע של כרטיס
export class CardComponent {

      @Input() image: string|undefined
      @Input() title: string|undefined
      @Input() desceibtion: string|undefined
      @Input() price: string|undefined
      @Input() id:number|undefined
      @Output() sendToFather=new EventEmitter()
     
 send()
{
  const h = Number(this.id);
  this.sendToFather.emit(h);
}
  
      
 }
