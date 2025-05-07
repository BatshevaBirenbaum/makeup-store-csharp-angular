using Microsoft.AspNetCore.Mvc;
using IBll;
using Dto;

namespace MacProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PurchasesController : ControllerBase
    {
        IBllServices<PurchaseDto> p;
        public PurchasesController(IBllServices<PurchaseDto> p)
        {
            this.p = p;
        }
        [HttpPost]
        public async Task<PurchaseDto> AddAsync(PurchaseDto purchase)
        {
          
            return await this.p.AddAsync(purchase);
        }


    }
}


