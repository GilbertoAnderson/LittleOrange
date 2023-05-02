using Microsoft.AspNetCore.Mvc;
using prestadorBase.Models;
using prestadorBase.Data;
using Microsoft.EntityFrameworkCore;

namespace prestadorBase.Controllers
{
    [ApiController]
    [Route("api/[Controller]")]
    public class prestadorBaseController : ControllerBase
    {
        private readonly PrestadorBaseDBContext _context;

        public prestadorBaseController(PrestadorBaseDBContext context) => _context = context;


        [HttpGet]
        public async Task<IEnumerable<PrestadorBase>> Get()
            => await _context.PrestadoresBase.ToListAsync();

        [HttpGet("id")]
        public async Task<IActionResult> GetById(int id)
        {
            var prestador = await _context.PrestadoresBase.FindAsync(id);
            return prestador == null ? NotFound() : Ok(prestador);
        }



        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        public async Task<IActionResult> Create(PrestadorBase prestadorBase)
        {
            await _context.PrestadoresBase.AddAsync(prestadorBase);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetById), new { id = prestadorBase.idPrestador }, prestadorBase);

        }


    }
}