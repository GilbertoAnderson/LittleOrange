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
    
    public partial class tblEspecialidade
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblEspecialidade()
        {
            this.tblPrestadorBase = new HashSet<tblPrestadorBase>();
            this.tblPrestadorEspecialidade = new HashSet<tblPrestadorEspecialidade>();
        }
    
        public int idEspecialidade { get; set; }
        public string Area { get; set; }
        public string Descricao { get; set; }
        public int idStatus { get; set; }
        public string Icone { get; set; }
    
        public virtual tblStatus tblStatus { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblPrestadorBase> tblPrestadorBase { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblPrestadorEspecialidade> tblPrestadorEspecialidade { get; set; }
    }
}
