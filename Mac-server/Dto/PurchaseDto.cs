﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dto
{
    public class PurchaseDto
    {
        public int PurchaseId { get; set; }
        public int CustomerId { get; set; }
        public string? MonthBirth { get; set; }
        public decimal PriceBeforeBD { get; set; }
        public string? Note { get; set; }
    }
}
