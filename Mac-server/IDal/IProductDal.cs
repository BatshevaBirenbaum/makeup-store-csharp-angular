using System;
using Dto;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IDal
{
    public interface IProductDal
    {
        Task<List<ProductsDto>> GetByIdAsync(int id);
    }
}
