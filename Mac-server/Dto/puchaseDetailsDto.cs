using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dto
{
    public class puchaseDetailsDto
    {
        public int PurchaseId { get; set; }
        public List<puchaseDetailsArray> PuchaseDetailsList { get; set; } = new List<puchaseDetailsArray>();

    }
}
