using Dto;
using IBll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBll
{

    public interface ICustomersBll : IBllServices<CustomersDto>
    {
        Task<CustomersDto> GetByNameAsync(string str);

        //Task<List<CustomersDto>> SelectAllAsync();

    }

}
