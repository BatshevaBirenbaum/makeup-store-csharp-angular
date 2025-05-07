using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dto;
using System.Threading.Tasks;
using Dal.Models;

namespace Dal.Converters
{
    internal class ProductsConverters
    {
        public static ProductsDto ToProductDto(Product product)
        {
            ProductsDto ProductNew = new ProductsDto();
            ProductNew.ProductId = product.ProductId;
            ProductNew.Name = product.Name;
            ProductNew.CategoryId = product.CategoryId;
            ProductNew.Description = product.Description;
            ProductNew.Price = product.Price;
            ProductNew.Image = product.Image;
            ProductNew.StockQuantity = product.StockQuantity;
            ProductNew.LastUpdated = product.LastUpdated;
            //ProductNew.Product = product.Product;

            return ProductNew;
        }
        public static Product ToProduct(ProductsDto product)
        {
            Product ProductNew = new Product();
            ProductNew.Name = product.Name;
            ProductNew.CategoryId = product.CategoryId;
            ProductNew.Description = product.Description;
            ProductNew.Price = product.Price;
            ProductNew.Image = product.Image;
            ProductNew.StockQuantity = product.StockQuantity;
            ProductNew.LastUpdated = product.LastUpdated;
            return ProductNew;
        }
        //public static List<Dto_Common_Enteties.ProductsDto> ToListproductDto(List<models.Product> ProductsList)
        //{
        //    List<Dto_Common_Enteties.ProductsDto> lnew = new List<Dto_Common_Enteties.ProductsDto>();
        //    foreach (var lo in ProductsList)
        //    {
        //        lnew.Add(ToProductDto(lo));
        //    }
        //    return lnew;
        //}
        public static List<ProductsDto> ToListproductDto(List<Product> productsList)
        {
            return productsList.Select(product => ToProductDto(product)).ToList();
        }
    }
}

