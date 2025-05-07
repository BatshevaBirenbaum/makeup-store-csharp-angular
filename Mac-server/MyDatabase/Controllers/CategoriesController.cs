using Microsoft.AspNetCore.Mvc;

namespace MacProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController:ControllerBase
    {
        IBll.IcategoriesBll c;
        public CategoriesController(IBll.IcategoriesBll c)
        {
            this.c = c;
        }
        [HttpGet]
        public async Task<List<Dto.CategoriesDto>> SelectAllAsync()
        {
            return await c.SelectAllAsync();
        }
    }
}
