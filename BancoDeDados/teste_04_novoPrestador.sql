/*
	Teste automatizado novo morador
	The Little Orange
	Gilberto Anderson
	20 agosto 2022

	rodar este script junto com o teste_02_novoMorador.robot
	com ele vc conseguira validar se os dados estao cadastrados no banco
	e conseguira remover os dados para realizar novo teste

	
*/



declare 
	@idUsuario		int,
	@idCondominio	int,
	@idPrestador	int,
	@idUserPrestado	int

select @idUsuario = idUsuario  from tblusuario where Nome = 'Morador teste Automatizado'
select @idCondominio = idCondominio from tblCondominio where nome='Condominio Teste Automatizado'
select @idPrestador = idPrestador   from tblPrestador   where empresa='Prestador Teste Automatizado' 
select @idUserPrestado = idUsuario  from tblusuario     where Nome = 'Prestador Teste Automatizado'


select * from tblusuario	where idUsuario		= @idUsuario
select * from tblusuario	where idUsuario		= @idUserPrestado
select * from tblCondominio where idCondominio	= @idCondominio

select * from tblUsuarioCondominio 
		where idUsuario = @idUsuario
		  and idCondominio	= @idCondominio

select * from tblUsuarioPerfil  
		where idUsuario		= @idUsuario

select * from tblPrestador  where idPrestador = @idPrestador		
select * from  tblPrestadorEspecialidade where idPrestador = @idPrestador



select * from tblAvaliacao where idPrestador = @idPrestador

select * from tblusuario	where  cpf_cnpj = '64034210001'
select * from tblPrestador  where  cpf_cnpj = '64034210001'

/*

--- limpa dados para teste automatizado

declare 
	@idUsuario		int,
	@idCondominio	int,
	@idPrestador	int

select @idUsuario = idUsuario  from tblusuario where Nome = 'Morador teste Automatizado'
select @idCondominio = idCondominio from tblCondominio where nome='Condominio Teste Automatizado'
select @idPrestador = idPrestador   from tblPrestador  where empresa='Prestador Teste Automatizado' 

delete from tblAvaliacao where idPrestador = @idPrestador
delete from tblPrestadorEspecialidade	where idPrestador = @idPrestador
delete from tblPrestador				where idPrestador = @idPrestador
delete from tblUsuarioCondominio		where idUsuario	  = @idUsuario and idCondominio	= @idCondominio
delete from tblCondominio				where idCondominio= @idCondominio
delete from tblusuario					where idUsuario	  = @idUsuario

*/


select * from tblusuario where email = 'usuario.teste@thelittleorange.app'