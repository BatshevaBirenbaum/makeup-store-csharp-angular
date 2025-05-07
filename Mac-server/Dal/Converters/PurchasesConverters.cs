using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dal.Models;
using Dto;
namespace Dal.Converters
{
    public class PurchasesConverters
    {
        public static PurchaseDto ToPurchaseDto(Purchase purchase)
        {
            PurchaseDto newPurchase = new PurchaseDto();
            newPurchase.PurchaseId = purchase.PurchaseId;
            newPurchase.CustomerId = purchase.CustomerId;
            //newPurchase.MonthBirth = newPurchase.MonthBirth;
            newPurchase.PriceBeforeBD = purchase.TotalAmount;
            newPurchase.Note = purchase.Note;
            return newPurchase;
        }


        public static Purchase ToPurchase(PurchaseDto purchase)
        {
            Purchase newPurchase = new Purchase();
            newPurchase.PurchaseId = purchase.PurchaseId;
            //purchase.MonthBirth = purchase.MonthBirth;
            newPurchase.CustomerId = purchase.CustomerId;
            newPurchase.TotalAmount = purchase.PriceBeforeBD;
            newPurchase.Note = purchase.Note;
            return newPurchase;
        }
        
        public static List<PurchaseDto> ToListPurchaseDto(List<Purchase> listPurchaseDto)
        {
            List<PurchaseDto> newlistPurchase = new List<PurchaseDto>();
            foreach (Purchase purchase in listPurchaseDto)
            {
                newlistPurchase.Add(ToPurchaseDto(purchase));
            }
            return newlistPurchase;
            ;
        }

       
    }

}
