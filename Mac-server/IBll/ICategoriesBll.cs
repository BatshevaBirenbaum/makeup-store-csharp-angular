using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBll
{
    public interface IcategoriesBll
    {
        Task<List<Dto.CategoriesDto>> SelectAllAsync();
    }
}
