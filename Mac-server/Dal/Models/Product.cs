using System;
using System.Collections.Generic;

namespace Dal.Models;

public partial class Product
{
    public int ProductId { get; set; }

    public string Name { get; set; } = null!;

    public int CategoryId { get; set; }

    public string? Description { get; set; }

    public decimal Price { get; set; }

    public string? Image { get; set; }

    public int StockQuantity { get; set; }

    public DateTime LastUpdated { get; set; }

    public virtual Category Category { get; set; } = null!;

    public virtual ICollection<PurchaseDetail> PurchaseDetails { get; set; } = new List<PurchaseDetail>();
}
