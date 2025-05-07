using IBll;
using Microsoft.AspNetCore.Mvc;

namespace MacProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController:ControllerBase
    {
        private readonly IProductsBll p;
        public ProductsController(IBll.IProductsBll p)
        {
            this.p = p;
        }
        [HttpGet("{id}")]
        public async Task<List<Dto.ProductsDto>> GetByIdAsync(int id)
        {
            return await p.GetByIdAsync(id);
        }


    }
}
