using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IDal;
using System.Threading.Tasks;
using Dto;
using Microsoft.EntityFrameworkCore;
using Dal.Models;

namespace Dal
{
    public class PurchaseDetailsDal : IDal<puchaseDetailsDto>
    {
        MacDbContext db;
        public PurchaseDetailsDal(MacDbContext db)
        {
            this.db = db;
        }

        public async Task<puchaseDetailsDto> AddAsync(puchaseDetailsDto purchaseDetails)
        {
            try
            {
                foreach (var detail in purchaseDetails.PuchaseDetailsList)
                {
                    if (detail.product != null)
                    {
                        if (detail.product == null)
                        {
                            throw new ArgumentException("Product cannot be null in purchase details.");
                        }
                        var pd = new PurchaseDetail
                        {

                            PurchaseId = purchaseDetails.PurchaseId,
                            ProductId = detail.product.ProductId,
                            Quantity = detail.quantity
                        };
                        await db.PurchaseDetails.AddAsync(pd);
                    }
                }

                await db.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding purchase details", ex);
            }

            return purchaseDetails;
        }


    }
}
