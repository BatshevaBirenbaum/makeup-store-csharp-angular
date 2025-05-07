using Dal.Models;
using Microsoft.AspNetCore.Mvc;

namespace MacProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomersController : ControllerBase
    {
        IBll.ICustomersBll c;
        public CustomersController(IBll.ICustomersBll c)
        {
            this.c = c;
        }
        //[HttpGet]
        //public async Task<List<Dto.CustomersDto>> SelectAllAsync()
        //{
        //    return await c.SelectAllAsync();
        //}
        [HttpGet("{email}")]
        public async Task<Dto.CustomersDto> GetByNameAsync(string email)
        {
            return await c.GetByNameAsync(email);
        }

        [HttpPost]
        public async Task<Dto.CustomersDto> AddAsync(Customer customer)
        {
            var customerDto = new Dto.CustomersDto
            {
                Name = customer.Name,
                Phone = customer.Phone,
                Email = customer.Email,
                BirthDate = customer.BirthDate
            };

            // קריאה למתודת ה-BLL להוספת הלקוח
            var addedCustomer = await c.AddAsync(customerDto); 

            return addedCustomer;
        }
    }
    }
