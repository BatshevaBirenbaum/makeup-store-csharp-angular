using Dto;
using IDal;
using IBll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IBll;

namespace Bll
{
    public class ProductsBll : IProductsBll
    {
        IProductDal p;
        public ProductsBll(IProductDal dalProduct)
        {
            this.p = dalProduct;
        }
        public async Task<List<ProductsDto>> GetByIdAsync(int id)
        {
            return await p.GetByIdAsync(id);
        }

        //public Task<ProductsDto> GetByNameAsync(string str)
        //{
        //    throw new NotImplementedException();
        //}

        //public Task<List<ProductsDto>> SelectAllAsync()
        //{
        //    throw new NotImplementedException();
        //}
    }


}
