using Microsoft.EntityFrameworkCore;
using PrestadorBaseAPI.Models;

namespace PrestadorBaseAPI.Data
{
    public class PrestadorBaseAPIDBContext : DbContext
    {

        public PrestadorBaseAPIDBContext(DbContextOptions options) : base(options)
        { }

        public DbSet<PrestadorBase> Prestadores { get; set; }

    }

}