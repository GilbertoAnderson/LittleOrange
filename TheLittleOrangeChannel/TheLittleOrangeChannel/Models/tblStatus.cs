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
    
    public partial class tblStatus
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tblStatus()
        {
            this.tblAssinaturas = new HashSet<tblAssinaturas>();
            this.tblAvaliacao = new HashSet<tblAvaliacao>();
            this.tblCliques = new HashSet<tblCliques>();
            this.tblCondominio = new HashSet<tblCondominio>();
            this.tblEspecialidade = new HashSet<tblEspecialidade>();
            this.tblParcelas = new HashSet<tblParcelas>();
            this.tblPerfil = new HashSet<tblPerfil>();
            this.tblPlano_Abrangencia = new HashSet<tblPlano_Abrangencia>();
            this.tblPrestador = new HashSet<tblPrestador>();
            this.tblPrestadorBase = new HashSet<tblPrestadorBase>();
            this.tblPrestadorEspecialidade = new HashSet<tblPrestadorEspecialidade>();
            this.tblUsuarioCondominio = new HashSet<tblUsuarioCondominio>();
            this.tblUsuarioPerfil = new HashSet<tblUsuarioPerfil>();
            this.tblUsuario = new HashSet<tblUsuario>();
        }
    
        public int idStatus { get; set; }
        public string Objeto { get; set; }
        public string Descricao { get; set; }
        public Nullable<System.DateTime> DtCriacao { get; set; }
        public Nullable<System.DateTime> DtAtualizacao { get; set; }
        public Nullable<int> idAlteracao { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblAssinaturas> tblAssinaturas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblAvaliacao> tblAvaliacao { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblCliques> tblCliques { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblCondominio> tblCondominio { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblEspecialidade> tblEspecialidade { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblParcelas> tblParcelas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblPerfil> tblPerfil { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblPlano_Abrangencia> tblPlano_Abrangencia { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblPrestador> tblPrestador { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblPrestadorBase> tblPrestadorBase { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblPrestadorEspecialidade> tblPrestadorEspecialidade { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblUsuarioCondominio> tblUsuarioCondominio { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblUsuarioPerfil> tblUsuarioPerfil { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tblUsuario> tblUsuario { get; set; }
    }
}
