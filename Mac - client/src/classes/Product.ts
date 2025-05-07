export class products{
    constructor(public productId?:number,public name?:string ,public categoryId?: number ,public description?: string
        ,public price?:number, public image?: string, public stockQuantity?: number , public lastUpdated?: Date
    ){}
}