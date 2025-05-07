using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dto;
using Dal.Models;

namespace Dal.Converters
{
    internal class CustomersConverters
    {
        public static CustomersDto ToCustomersDto(Customer customer)
        {
            CustomersDto customerNew = new CustomersDto();
            customerNew.CustomerId = customer.CustomerId;
            customerNew.Name = customer.Name;
            customerNew.Phone = customer.Phone;
            customerNew.Email = customer.Email;
            customerNew.BirthDate = customer.BirthDate;
            return customerNew;
        }
        public static Customer ToCustomer(CustomersDto customer)
        {
            Customer customerNew = new Customer();
            customerNew.CustomerId = customer.CustomerId;
            customerNew.Name = customer.Name;
            customerNew.Phone = customer.Phone;
            customerNew.Email = customer.Email;
            customerNew.BirthDate = customer.BirthDate;
            return customerNew;
        }
        public static List<CustomersDto> ToListOrderDto(List<Customer> listOrder)
        {
            List<CustomersDto> lnew = new List<CustomersDto>();
            foreach (var lo in listOrder)
            {
                lnew.Add(ToCustomersDto(lo));
            }
            return lnew;
        }
    }
}
