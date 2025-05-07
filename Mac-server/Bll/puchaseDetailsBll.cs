using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IBll;
using Dto;
using System.Threading.Tasks;
using IDal;

namespace Bll
{
    public class puchaseDetailsBll : IBllServices<puchaseDetailsDto>
    {
        private readonly IDal<puchaseDetailsDto> dalPuchaseDetails;

        public puchaseDetailsBll(IDal<puchaseDetailsDto> pd)
        {
            this.dalPuchaseDetails = pd;
        }

        public async Task<puchaseDetailsDto> AddAsync(puchaseDetailsDto puchaseDetails)
        {
            return await dalPuchaseDetails.AddAsync(puchaseDetails);
        }


    }
}
