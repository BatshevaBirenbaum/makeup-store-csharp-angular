using Dto;
using IDal;
using System.Collections.Generic;
using System.Threading.Tasks;
using IBll;

namespace Bll
{
    public class CustomersBll : ICustomersBll
    {
        private readonly IcustomerDal dalCus;

        public CustomersBll(IcustomerDal c)
        {
            this.dalCus = c;
        }

        //public async Task<List<CustomersDto>> SelectAllAsync()
        //{
        //    return await dalCus.SelectAllAsync();
        //}

        public async Task<CustomersDto> AddAsync(CustomersDto customerDto)
        {
            return await dalCus.AddAsync(customerDto);  
        }
        public async Task<CustomersDto> GetByNameAsync(string name)
        {
            return await dalCus.GetByNameAsync(name);  
        }


    }
}
