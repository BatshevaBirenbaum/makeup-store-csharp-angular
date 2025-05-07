using Dto;
using IDal;
using IBll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Bll
{
        public class CategoriesBll : IcategoriesBll
        {
            private readonly ICategoyDal dalcat;

            public CategoriesBll(ICategoyDal c)
            {
                this.dalcat = c;
            }
            public async Task<List<CategoriesDto>> SelectAllAsync()
            {
                return await dalcat.SelectAllAsync();
            }
        //    public async Task<CategoriesDto> GetByNameAsync(string name)
        //     {
        //    return await dalcat.GetByNameAsync(name);
        //     }

        //public Task<List<ProductsDto>> GetByIdAsync(int id)
        //{
        //    throw new NotImplementedException();
        //}
    }
    
}
