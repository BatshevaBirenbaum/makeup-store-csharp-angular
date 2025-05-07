using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Dal.Models;
using Dto;


namespace Dal.Converters
{
    public class CategoriesConverters
    {

        public static CategoriesDto ToCategoryDto(Category category)
        {
            CategoriesDto categoryNew = new CategoriesDto();
            categoryNew.CategoryId = category.CategoryId;
            categoryNew.Name = category.Name;

            return categoryNew;
        }
        public static Category ToCategory(CategoriesDto category)
        {
            Category categoryNew = new Category();
            categoryNew.CategoryId = category.CategoryId;
            categoryNew.Name = category.Name;
            return categoryNew;
        }
        public static List<CategoriesDto> ToListOrderDto(List<Category> listOrder)
        {
            List<CategoriesDto> lnew = new List<CategoriesDto>();
            foreach (var lo in listOrder)
            {
                lnew.Add(ToCategoryDto(lo));
            }
            return lnew;
        }
    }
}



