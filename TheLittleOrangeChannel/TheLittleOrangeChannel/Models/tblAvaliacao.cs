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
    
    public partial class tblAvaliacao
    {
        public int idAvaliacao { get; set; }
        public int idPrestador { get; set; }
        public int idMorador { get; set; }
        public int idStatus { get; set; }
        public Nullable<System.DateTime> dtAvaliacao { get; set; }
        public Nullable<int> NotaAvaliacao { get; set; }
        public string Mensagem { get; set; }
    
        public virtual tblUsuario tblUsuario { get; set; }
        public virtual tblPrestador tblPrestador { get; set; }
        public virtual tblStatus tblStatus { get; set; }
    }
}
