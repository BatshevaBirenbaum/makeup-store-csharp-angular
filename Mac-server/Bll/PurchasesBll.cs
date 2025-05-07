using Dto;
using IDal;
using IBll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bll
{
    public class PurchasesBll : IBllServices<PurchaseDto>
    {
        private readonly IDal<PurchaseDto> dalPurchase;

        public PurchasesBll(IDal<PurchaseDto> p)
        {
            this.dalPurchase = p;
        }

        public async Task<Dto.PurchaseDto> AddAsync(PurchaseDto purchaseDto)
        {
            purchaseDto.PriceBeforeBD = calcPrice(purchaseDto.MonthBirth, purchaseDto.PriceBeforeBD);
            return await dalPurchase.AddAsync(purchaseDto); // כאן זה עובד
        }

        public decimal calcPrice(string month, decimal price)
        {
            // מקבל את החודש הנוכחי כמספר
            int currentMonth = DateTime.Now.Month;

            if (currentMonth == int.Parse(month))
            {
                return price - price * 0.20m;
            }
            return price;
        }
    }
}
