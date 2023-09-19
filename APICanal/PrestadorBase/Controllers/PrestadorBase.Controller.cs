using Microsoft.AspNetCore.Mvc;
using PrestadorBaseAPI.Models;
using PrestadorBaseAPI.Data;
using Microsoft.EntityFrameworkCore;

namespace PrestadorBaseAPI.Controllers
{
    [ApiController]
    [Route("api/[Controller]")]
    public class PrestadorBaseAPIController : ControllerBase
    {
        private readonly PrestadorBaseAPIDBContext _context;

        public PrestadorBaseAPIController(PrestadorBaseAPIDBContext context)
        { this._context = context; }


        //[HttpGet]
        //public async Task<IEnumerable<prestadorBase>> Get()
        //    => await _context.Prestadores.ToListAsync();

        [HttpGet]
        public IActionResult Get()
        {
            return Ok(_context.Prestadores.ToList());

        }

        [HttpGet("id")]
        public async Task<IActionResult> GetById(int id)
        {
            var prestador = await _context.Prestadores.FindAsync(id);
            return prestador == null ? NotFound() : Ok(prestador);
        }



        //[HttpPost]
        //[ProducesResponseType(StatusCodes.Status201Created)]
        //public async Task<IActionResult> Create(PrestadorBase)
        //{
        //    await _context.Prestadores.AddAsync(PrestadorBase);
        //    await _context.SaveChangesAsync();

        ///    return CreatedAtAction(nameof(GetById), new { id = PrestadorBase.idPrestador }, Prestador);

        //}


    }
}