using System.ComponentModel.DataAnnotations;

namespace prestadorBase.Models
{
    public class PrestadorBase
    {
        [Key]
        public int idPrestador { get; set; }
        public string? Empresa { get; set; }
        public string? Email { get; set; }
        public string? Celular { get; set; }
        public string? CPF_CNPJ { get; set; }
        public int diasPromocao { get; set; }
        public DateTime DataCriacao { get; set; }
        public int idCondominio { get; set; }
        public int idCanal { get; set; }
        public int idPlano { get; set; }
        public int idAbrangencia { get; set; }
        public int idFormaPagto { get; set; }
        public int idEspecialidade { get; set; }
        public int idStatus { get; set; }
    }
}
