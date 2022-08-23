/*
 TheLittleOrange
 Gilberto Anderson
 total de cliques por especialidade do prestador


*/



select * from  tblCliques
select * from  tblPrestadorEspecialidade

declare @idPrestador  int
set @idPrestador  = 1

select  SUM(1),
		domi.descricao
from  tblCliques clic
inner join tblPrestadorEspecialidade pres on pres.idPrestador = clic.idPrestador
inner join tblDominios               domi on clic.idOrigem  = domi.idDominio
inner join tblStatus                 stat on clic.idstatus = stat.idstatus
where stat.idStatus = (select idStatus from tblStatus where Objeto = 'CLIQUE' and Descricao = 'VALIDO' )
and pres.idEspecialidade in ( select  espe.idEspecialidade 
								from tblEspecialidade espe
								inner join tblPrestadorEspecialidade pres on pres.idEspecialidade = espe.idEspecialidade
								where pres.idPrestador = @idPrestador )
group by domi.descricao


