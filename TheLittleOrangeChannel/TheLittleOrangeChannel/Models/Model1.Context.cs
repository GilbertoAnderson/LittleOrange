﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class TheLittleOrangeEntities : DbContext
    {
        public TheLittleOrangeEntities()
            : base("name=TheLittleOrangeEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblPrestadorEspecialidade> tblPrestadorEspecialidade { get; set; }
        public virtual DbSet<tblAssinaturas> tblAssinaturas { get; set; }
        public virtual DbSet<tblAvaliacao> tblAvaliacao { get; set; }
        public virtual DbSet<tblCliques> tblCliques { get; set; }
        public virtual DbSet<tblCondominio> tblCondominio { get; set; }
        public virtual DbSet<tblDominios> tblDominios { get; set; }
        public virtual DbSet<tblEspecialidade> tblEspecialidade { get; set; }
        public virtual DbSet<tblParcelas> tblParcelas { get; set; }
        public virtual DbSet<tblPerfil> tblPerfil { get; set; }
        public virtual DbSet<tblPrestador> tblPrestador { get; set; }
        public virtual DbSet<tblStatus> tblStatus { get; set; }
        public virtual DbSet<tblUsuario> tblUsuario { get; set; }
        public virtual DbSet<tblUsuarioCondominio> tblUsuarioCondominio { get; set; }
        public virtual DbSet<tblUsuarioPerfil> tblUsuarioPerfil { get; set; }
    
        public virtual ObjectResult<string> sp_ConvitePrestador(Nullable<int> idPrestador)
        {
            var idPrestadorParameter = idPrestador.HasValue ?
                new ObjectParameter("idPrestador", idPrestador) :
                new ObjectParameter("idPrestador", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("sp_ConvitePrestador", idPrestadorParameter);
        }
    
        public virtual ObjectResult<string> sp_ConvitePrestadorEmail(Nullable<int> idPrestador)
        {
            var idPrestadorParameter = idPrestador.HasValue ?
                new ObjectParameter("idPrestador", idPrestador) :
                new ObjectParameter("idPrestador", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("sp_ConvitePrestadorEmail", idPrestadorParameter);
        }
    
        public virtual ObjectResult<string> sp_ConvitePrestadorWhatsapp(Nullable<int> idPrestador)
        {
            var idPrestadorParameter = idPrestador.HasValue ?
                new ObjectParameter("idPrestador", idPrestador) :
                new ObjectParameter("idPrestador", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("sp_ConvitePrestadorWhatsapp", idPrestadorParameter);
        }
    }
}