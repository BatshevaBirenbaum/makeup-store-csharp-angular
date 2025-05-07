import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'description',
  standalone: true
})
//פיפ לחתוך תאור מוצר עפ פסיק או נקודה
export class DescriptionPipe implements PipeTransform {
  transform(value: string | undefined): string {
    if (!value) return '';

    // מחפש את המיקום של הפסיק או הנקודה הראשונה
    const separatorIndex = value.search(/[.,]/);
    if (separatorIndex === -1) {
      return value; 
    }
    return value.substring(0, separatorIndex );
}
    }
