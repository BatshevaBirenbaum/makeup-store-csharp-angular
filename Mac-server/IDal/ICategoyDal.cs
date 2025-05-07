using System;
using System.Collections.Generic;
using System.Linq;
using Dto;

namespace IDal
{
    public interface ICategoyDal
    {
         Task<List<CategoriesDto>> SelectAllAsync();
         Task<CategoriesDto> GetByNameAsync(string str);
    }
}
