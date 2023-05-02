

select *  from tblEspecialidade order by descricao

--delete from  tblEspecialidade  where idEspecialidade =69


--insert into tblEspecialidade(Area, Descricao, idStatus) values('Saúde','Academia',12)



declare @idPrestador int
select @idPrestador = idPrestador  from tblPrestador where Empresa = 'Uchida Fisioterapia'
select * from tblPrestadorEspecialidade where  idPrestador = @idPrestador
/*
delete from tblPrestadorEspecialidade where  idPrestador = (select idPrestador  from tblPrestador where Empresa = 'Uchida Fisioterapia')
delete from tblPrestador where Empresa = 'Uchida Fisioterapia'
*/
select *  from tblUsuario order by celular

--grupo de vendas
-- ‎Acesse este link para entrar no meu grupo do WhatsApp: https://chat.whatsapp.com/Dkw333aWXuaIIU3ec6qH9I