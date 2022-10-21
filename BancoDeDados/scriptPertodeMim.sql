/*
   GRAVANDO UM NOVO PRESTADOR
   teste com usuario da Naomi

*/

declare @idPrestador int
declare @idUsuario int
declare @idCondominio int 
declare @empresa varchar(100)
set @empresa  = 'Prestador Teste Automatizado '


select @idPrestador = idPrestador , @idUsuario = idUsuario from tblPrestador  where Empresa = @empresa
select @idCondominio = idCondominio  from tblUsuarioCondominio where idUsuario = @idUsuario

select *  from tblPrestador  where Empresa = @empresa
select *  from tblPrestadorEspecialidade where idPrestador = @idPrestador 
select *  from tblUsuario where idUsuario = @idUsuario
select *  from tblCondominio where idCondominio = @idCondominio
select *  from tblAssinaturas  where idPrestador = @idPrestador 


--select *  from tblUsuario


--select *  from tblDominios where objeto = 'abrangencia'

--update tblAssinaturas set idAbrangencia  = 2
--update tblPrestador 
--set UF = 'SP'
--,CodigoIBGE =3547809


/*
limpar dados prestador 



declare @idPrestador int
declare @idUsuario int
declare @idCondominio int 
declare @empresa varchar(100)
set @empresa  = 'Prestador Teste Automatizado '


select @idPrestador = idPrestador , @idUsuario = idUsuario from tblPrestador  where Empresa = @empresa
select @idCondominio = idCondominio  from tblUsuarioCondominio where idUsuario = @idUsuario


delete from tblAssinaturas  where idPrestador = @idPrestador 
delete from tblUsuario where idUsuario = @idUsuario
delete from tblPrestadorEspecialidade where idPrestador = @idPrestador 
delete from tblPrestador  where Empresa = @empresa


select *  from tblPrestador  where Empresa = @empresa
select *  from tblPrestadorEspecialidade where idPrestador = @idPrestador 
select *  from tblUsuario where idUsuario = @idUsuario
select *  from tblCondominio where idCondominio = @idCondominio
select *  from tblAssinaturas  where idPrestador = @idPrestador 











*/

