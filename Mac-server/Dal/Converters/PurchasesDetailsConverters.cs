using Dal.Models;
using Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Converters
{
    public class PurchasesDetailsConverters
    {
        public static puchaseDetailsDto ToPurchaseDetailsDto(PurchaseDetail pd)
        {
            var newPurchaseD = new puchaseDetailsDto
            {
                PurchaseId = pd.PurchaseId,
                PuchaseDetailsList = new List<puchaseDetailsArray>()
            };

            newPurchaseD.PuchaseDetailsList.Add(new puchaseDetailsArray
            {
                product = new ProductsDto { ProductId = pd.ProductId },
                quantity = pd.Quantity
            });

            return newPurchaseD;
        }

        //public static puchaseDetailsDto ToPurchaseDetailsDto(PurchaseDetail pd)
        //{
        //    puchaseDetailsDto newPurchaseD = new puchaseDetailsDto();
        //    newPurchaseD.PurchaseId = pd.PurchaseId;
        //    newPurchaseD.puchaseDetailsList.ForEach(pud =>
        //    {
        //        pud.product.ProductId = pd.ProductId;
        //        pud.quantity= pd.Quantity;
        //    });
        //    return newPurchaseD;
        //}
        public static puchaseDetailsArray ToPuchaseDetailsArray(PurchaseDetail detail)
        {
            return new puchaseDetailsArray
            {
                product = new ProductsDto
                {
                    ProductId = detail.ProductId,
                },
                quantity = detail.Quantity
            };
        }
        public static List<PurchaseDetail> ToPurchaseDetailsList(puchaseDetailsDto dto)
        {
            var purchaseDetails = new List<PurchaseDetail>();

            foreach (var detail in dto.PuchaseDetailsList)
            {
                var purchaseDetail = new PurchaseDetail
                {
                    PurchaseId = dto.PurchaseId,
                    ProductId = detail.product.ProductId,
                    Quantity = detail.quantity
                };
                purchaseDetails.Add(purchaseDetail);
            }

            return purchaseDetails;
        }


    }
}
