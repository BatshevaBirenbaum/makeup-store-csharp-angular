using Dto;
using IBll;
using Microsoft.AspNetCore.Mvc;

namespace MacProject.Controllers
{

    [Route("api/[controller]")]
    [ApiController]
    public class PurchasesDetailsController:ControllerBase
    {
        IBllServices<puchaseDetailsDto> p;
        public PurchasesDetailsController(IBllServices<puchaseDetailsDto> p)
        {
            this.p = p;
        }

        [HttpPost("details")]
        public async Task<IActionResult> AddAsync([FromBody] puchaseDetailsDto purchaseDetailsDto)
        {
            if (purchaseDetailsDto == null || purchaseDetailsDto.PuchaseDetailsList.Count == 0)
            {
                return BadRequest("Invalid purchase details.");
            }

            try
            {
                var result = await p.AddAsync(purchaseDetailsDto);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
        
        //public async Task<puchaseDetailsDto> AddAsync(puchaseDetailsDto purchase)
        //{
        //    //var purchaseDto = new PurchaseDto
        //    //{
        //    //    PurchaseId = purchase.PurchaseId,
        //    //    CustomerId = purchase.CustomerId,
        //    //    PriceBeforeBD = purchase.PriceBeforeBD,
        //    //    Note = purchase.Note,
        //    //};


        //    //var addedpPurchase = await p.AddAsync(purchaseDto);

        //    return purchase;
        //}
    }
}
