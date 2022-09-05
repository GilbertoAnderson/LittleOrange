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
    
    public partial class tblCondominio
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblCondominio()
        {
            this.tblPrestadorBase = new HashSet<tblPrestadorBase>();
            this.tblPrestador = new HashSet<tblPrestador>();
            this.tblUsuarioCondominio = new HashSet<tblUsuarioCondominio>();
        }
    
        public int idCondominio { get; set; }
        public string Nome { get; set; }
        public string Endereco { get; set; }
        public string Complemento { get; set; }
        public string Bairro { get; set; }
        public string Cidade { get; set; }
        public string UF { get; set; }
        public string Pais { get; set; }
        public string CEP { get; set; }
        public string Fone { get; set; }
        public string CodigoIBGE { get; set; }
        public Nullable<decimal> Latitude { get; set; }
        public Nullable<decimal> Longitude { get; set; }
        public int idUsuario { get; set; }
        public int idStatus { get; set; }
        public Nullable<int> Numero { get; set; }
    
        public virtual tblUsuario tblUsuario { get; set; }
        public virtual tblStatus tblStatus { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblPrestadorBase> tblPrestadorBase { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblPrestador> tblPrestador { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblUsuarioCondominio> tblUsuarioCondominio { get; set; }
    }
}
