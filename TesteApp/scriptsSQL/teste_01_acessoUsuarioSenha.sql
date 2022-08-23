/*
	Teste automatizado acesso ao sistema
	The Little Orange
	Gilberto Anderson
	20 agosto 2022

	rodar este script junto com o teste_01_acesso TelaInicial.robot
	com ele vc conseguira validar se os acessos estão funcionando
	estamos testando 

	
*/



declare 
	@idUsuario		int

select @idUsuario = idUsuario  from tblusuario where Nome = 'Usuario teste Automatico'
select * from tblusuario	where idUsuario		= @idUsuario


select * from tblUsuarioPerfil  
		where idUsuario		= @idUsuario

			   		 
/*

--- limpa dados para teste automatizado

declare 
	@idUsuario		int

select @idUsuario = idUsuario  from tblusuario where Nome = 'Usuario teste Automatico'

delete from tblusuario					where idUsuario	  = @idUsuario

*/