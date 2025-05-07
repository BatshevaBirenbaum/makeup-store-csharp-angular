using Dto;
using IBll;
using IDal;
using Microsoft.EntityFrameworkCore;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


builder.Services.AddScoped<IcustomerDal, Dal.CustomersDal>();
builder.Services.AddScoped<ICustomersBll, Bll.CustomersBll>();

builder.Services.AddScoped<ICategoyDal, Dal.CategoriesDal>();
builder.Services.AddScoped<IcategoriesBll, Bll.CategoriesBll>();


builder.Services.AddScoped<IDal<puchaseDetailsDto>, Dal.PurchaseDetailsDal>();
builder.Services.AddScoped<IBllServices<puchaseDetailsDto>, Bll.puchaseDetailsBll>();

builder.Services.AddScoped<IDal<PurchaseDto>, Dal.PurchaseDal>();
builder.Services.AddScoped<IBllServices<PurchaseDto>, Bll.PurchasesBll>();

builder.Services.AddScoped<IProductDal, Dal.ProductsDal>();
builder.Services.AddScoped<IProductsBll, Bll.ProductsBll>();

builder.Services.AddDbContext<Dal.Models.MacDbContext>
(options =>
options.UseSqlServer(builder.Configuration.GetConnectionString("SeminarConnection")));

builder.Services.AddCors(opotion => opotion.AddPolicy("AllowAll",//נתינת שם להרשאה
    p => p.AllowAnyOrigin()//מאפשר כל מקור
    .AllowAnyMethod()//כל מתודה - פונקציה
    .AllowAnyHeader()));//וכל כותרת פונקציה

var app = builder.Build();
app.UseCors("AllowAll");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
