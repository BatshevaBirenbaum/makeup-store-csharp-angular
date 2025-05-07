using Dal.Models;
using Dto;
using IDal;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace Dal
{
    public class CustomersDal : IcustomerDal

    {
        MacDbContext db;
        public CustomersDal(MacDbContext db)
        {
            this.db = db;
        }
        //שליפה המשתמשים
        //public async Task<List<CustomersDto>> SelectAllAsync()
        //{
        //    var c = await db.Customers.ToListAsync();
        //    return Converters.CustomersConverters.ToListOrderDto(c);
        //}
        public async Task<CustomersDto> GetByNameAsync(string email)
        {
            var customer = await db.Customers
                           .FirstOrDefaultAsync(c => c.Email == email);
            if (customer == null)
                return null;
            return Converters.CustomersConverters.ToCustomersDto(customer);
        }
        public async Task<CustomersDto> AddAsync(CustomersDto customer)
        {
            var customerEntity = Converters.CustomersConverters.ToCustomer(customer);
            db.Customers.Add(customerEntity);
            await db.SaveChangesAsync();

            return Converters.CustomersConverters.ToCustomersDto(customerEntity);
        }

    }
}
