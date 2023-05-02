
select * from tblUsuario where idUsuario = 128



select * from tblPerfil 


select * from tblUsuarioPerfil


		insert into tblUsuarioPerfil(idUsuario, idPerfil, [idStatus], [dtValidade]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Paulo José Ribeiro Silva '),
				(select idPerfil  from tblPerfil  where Descricao = 'CANAL'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_PERFIL' and Descricao = 'ATIVO'),
				dateadd(month,3,GETDATE()))	



select * from tblPrestadorBase


select * from tblPrestador where idAbrangencia >  1

select * from tblAssinaturas

select idStatus from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'ATIVO'
select idStatus from tblStatus where Objeto = 'ASSINATURA' and Descricao = 'ATIVA'


select * from tblPrestador    prest
   inner join tblAssinaturas  assin on assin.idPrestador = prest.idPrestador   
                                   and assin.idStatus = (select idStatus from tblStatus where Objeto = 'ASSINATURA' and Descricao = 'ATIVA')
	where prest.idAbrangencia >  1