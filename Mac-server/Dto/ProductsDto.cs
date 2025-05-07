using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dto
{
    public class ProductsDto
    {
        public int ProductId { get; set; }

        public string Name { get; set; } = null!;

        public int CategoryId { get; set; }

        public string? Description { get; set; }

        public decimal Price { get; set; }

        public string? Image { get; set; }

        public int StockQuantity { get; set; }

        public DateTime LastUpdated { get; set; }

        public  int Product { get; set; } 

    }
}
