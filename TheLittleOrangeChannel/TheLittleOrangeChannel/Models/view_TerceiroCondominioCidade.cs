//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TheLittleOrangeChannel.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class view_TerceiroCondominioCidade
    {
        public int idCondominio { get; set; }
        public string codigoIBGE { get; set; }
        public string Nome { get; set; }
        public int idPrestador { get; set; }
        public string Empresa { get; set; }
        public Nullable<decimal> NotaAvaliacao { get; set; }
        public Nullable<int> Indicacoes { get; set; }
        public string C_codAbrangencia { get; set; }
        public string Abrangencia { get; set; }
    }
}