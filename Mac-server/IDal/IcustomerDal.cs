using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dto;

namespace IDal
{
    public interface IcustomerDal : IDal<CustomersDto>
    {
        //Task<List<CustomersDto>> SelectAllAsync();
        Task<CustomersDto> GetByNameAsync(string str);
    }
}
