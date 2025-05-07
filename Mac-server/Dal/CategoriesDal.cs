using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IDal;
using Dto;
using System.Threading.Tasks;
using Dal.Models;

namespace Dal
{

    public class CategoriesDal : ICategoyDal

    {
        MacDbContext db;
        public CategoriesDal(MacDbContext db)
        {
            this.db = db;
        }
        public async Task<CategoriesDto> GetByNameAsync(string Name)
        {
            var idcategory = await db.Categories
                           .FirstOrDefaultAsync(c => c.Name == Name);
            if (idcategory == null)
                return null;
            return Converters.CategoriesConverters.ToCategoryDto(idcategory);
        }
        public async Task<List<CategoriesDto>> SelectAllAsync()
        {
            var c = await db.Categories.ToListAsync();
            return Converters.CategoriesConverters.ToListOrderDto(c);
        }


    }
}
