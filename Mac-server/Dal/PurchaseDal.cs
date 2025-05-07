using Dto;
using IDal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dal.Models;

namespace Dal
{
    public class PurchaseDal : IDal<PurchaseDto>

    {
        MacDbContext db;
        public PurchaseDal(MacDbContext db)
        {
            this.db = db;
        }
        public async Task<Dto.PurchaseDto> AddAsync(PurchaseDto purchaseDto)
        {
            var purchas = new Purchase
            {
                PurchaseId = purchaseDto.PurchaseId,
                CustomerId = purchaseDto.CustomerId,
                TotalAmount = purchaseDto.PriceBeforeBD,
                Note = purchaseDto.Note
            };

            db.Purchases.Add(purchas);
            await db.SaveChangesAsync();
            return Converters.PurchasesConverters.ToPurchaseDto(purchas);

        }


    }


}
