using Microsoft.EntityFrameworkCore;
using prestadorBase.Models;

namespace prestadorBase.Data
{
    public class PrestadorBaseDBContext : DbContext
    {

        public PrestadorBaseDBContext(DbContextOptions<PrestadorBaseDBContext> options) : base(options)
        { }

        public DbSet<PrestadorBase> PrestadoresBase { get; set; }
    }

}