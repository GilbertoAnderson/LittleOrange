

select *  from tblEspecialidade 




insert into tblEspecialidade(Area, Descricao, idStatus) values('Serviços Gerais','Molduras Quadros',12)



declare @idPrestador int
select @idPrestador = idPrestador  from tblPrestador where Empresa = 'Uchida Fisioterapia'
select * from tblPrestadorEspecialidade where  idPrestador = @idPrestador
/*
delete from tblPrestadorEspecialidade where  idPrestador = (select idPrestador  from tblPrestador where Empresa = 'Uchida Fisioterapia')
delete from tblPrestador where Empresa = 'Uchida Fisioterapia'
*/
select *  from tblUsuario order by celular