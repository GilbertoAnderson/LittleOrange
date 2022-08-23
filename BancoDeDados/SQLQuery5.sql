/*
	Teste automatizado acesso ao sistema
	The Little Orange
	Gilberto Anderson
	22 agosto 2022

	rodar este script junto com o teste_05_avaliaPrestador.robot
	com ele vc conseguira avaliar o prestador

	
*/


declare 
	@idPrestador	int

select @idPrestador = idPrestador   from tblPrestador  where empresa='Prestador Teste Automatizado' 

select *  from tblPrestadorEspecialidade	where idPrestador = @idPrestador
select *  from tblPrestador					where idPrestador = @idPrestador
select *  from tblAvaliacao					where idPrestador = @idPrestador
select *  from tblCliques					where idPrestador = @idPrestador



/*



declare 
	@idPrestador	int

select @idPrestador = idPrestador   from tblPrestador  where empresa='Prestador Teste Automatizado' 

--delete   from tblCliques					where idPrestador = @idPrestador
--delete   from tblPrestadorEspecialidade	where idPrestador = @idPrestador
delete   from tblPrestador				where idPrestador = @idPrestador
delete   from tblAvaliacao				where idPrestador = @idPrestador


*/