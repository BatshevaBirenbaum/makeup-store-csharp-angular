namespace Dto
{
    public class CustomersDto
    {
        public int CustomerId { get; set; }

        public string Name { get; set; } = null!;

        public string? Phone { get; set; }

        public string? Email { get; set; }

        public DateOnly? BirthDate { get; set; }

    }
}
