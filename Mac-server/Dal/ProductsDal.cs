using Dal.Models;
using Dto;
using IDal;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal
{
      public class ProductsDal: IProductDal
    {

        MacDbContext db;
        public ProductsDal(MacDbContext db)
        {

            this.db = db;
        }
        public async Task<List<ProductsDto>> GetByIdAsync(int id)
        {
            var products = await db.Products
                 .Where(p => p.CategoryId == id) 
                      .ToListAsync();
            

            return Converters.ProductsConverters.ToListproductDto(products);


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
