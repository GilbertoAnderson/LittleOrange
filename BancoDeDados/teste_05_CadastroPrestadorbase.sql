select * from tblPrestadorBase

select * from tblPrestador WHERE CPF_CNPJ ='64034210001'
select * from tblPrestador WHERE email ='prestador.teste@thelittleorange.app'
select * from tblPrestadorEspecialidade where idPrestador = (select idPrestador from tblPrestador WHERE email ='prestador.teste@thelittleorange.app')

select * from tblUsuario WHERE CPF_CNPJ ='64034210001'
select * from tblUsuario WHERE email ='prestador.teste@thelittleorange.app'


select * from tblCondominio

select * from tblStatus
select * from tblDominios

DELETE  from tblPrestador WHERE idPrestador = 76

update tblPrestadorEspecialidade
set dtValidade = GETDATE()
where idPrestador = 77 and idespecialidade = 54

--declare 
--	@idUsuario		int,
--	@idCondominio	int,
--	@idPrestador	int

--select @idUsuario = idUsuario  from tblusuario where Nome = 'xuxux nabu cenoura'
--select @idCondominio = idCondominio from tblCondominio where idCondominio = 3
--select @idPrestador = idPrestador   from tblPrestador  where empresa='teste Giba' 

--delete from tblcLIQUES				where idPrestador = @idPrestador
--delete from tblAvaliacao where idPrestador = @idPrestador
--delete from tblPrestadorEspecialidade	where idPrestador = @idPrestador
--delete from tblPrestador				where idPrestador = @idPrestador


/*
delete  from tblPrestadorEspecialidade where idPrestador = (select idPrestador from tblPrestador WHERE email ='prestador.teste@thelittleorange.app')
delete  from tblPrestador WHERE CPF_CNPJ ='64034210001'
delete  from tblPrestador WHERE email ='prestador.teste@thelittleorange.app'

*/