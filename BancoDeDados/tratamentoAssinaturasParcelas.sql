/*
   tratamento de Assinaturas e parcelas

   Gilberto Anderson
   2022 05 07
*/

--delete  from tblAssinaturas

--delete  from tblParcelas where idParcela = 1
--delete  from tblAssinaturas
2022A10700000105
    

select * from tblParcelas
select * from tblDominios
select * from tblAssinaturas
select * from tblStatus

select * from tblPrestador

update tblDominios set Codigo = 'M1' where idDominio = 12
update tblDominios set Codigo = 'A1' where idDominio = 13
update tblDominios set Codigo = 'A3' where idDominio = 14

update tblDominios set Codigo = 'M1' where idDominio = 69
update tblDominios set Codigo = 'A1' where idDominio = 70
update tblDominios set Codigo = 'A3' where idDominio = 71



update tblDominios set Descricao = '26,00'  where idDominio = 62
update tblDominios set Descricao = '35,00'  where idDominio = 63
update tblDominios set Descricao = '53,00'  where idDominio = 64
update tblDominios set Descricao = '143,00' where idDominio = 65
update tblDominios set Descricao = '260,00' where idDominio = 66
update tblDominios set Descricao = '350,00' where idDominio = 67


update tblDominios set Descricao =  '26.00' where idDominio = 62
update tblDominios set Descricao =  '35.00' where idDominio = 63
update tblDominios set Descricao =  '53.00' where idDominio = 64
update tblDominios set Descricao = '143.00' where idDominio = 65
update tblDominios set Descricao = '260.00' where idDominio = 66
update tblDominios set Descricao = '350.00' where idDominio = 67



update tblDominios set Descricao =  '00,00' where idDominio = 68
update tblDominios set Descricao =  '00,00' where idDominio = 69
update tblDominios set Descricao =  '10,00' where idDominio = 70
update tblDominios set Descricao =  '20,00' where idDominio = 71



		insert into tblAssinaturas([idPrestador],[idCanal],[idAbrangencia],[idStatus],[Rastreador],[dtInicio],[dtTermino],[ValorContrato],[DiaPagamento],[Log])
		values(
		        1,				
				1,
				3,
				24,
				'2022A10700000105',
				getdate(),
				dateadd(month,6,GETDATE()),
				280.8,
				20,
				'15/03/2022 assinatura contrato Carol '		
		)



select prest.Empresa, 
       abra.Descricao 'abrangencia',
       stat.Descricao 'staus'
from tblPrestador    prest
inner join tblStatus stat on prest.idStatus = stat.idStatus
inner join tblDominios abra on prest.idAbrangencia  = abra.idDominio
where idPrestador = 1

select prest.Empresa,
       assi.Rastreador,
       stat.Descricao 'status',
	   parc.dataVencimento,
	   parc.valorDevido,
	   parc.dataPagamento,
	   parc.valorPago,
	   past.Descricao 'situacao'

from tblAssinaturas assi
inner join tblPrestador prest on assi.idPrestador = prest.idPrestador
inner join tblStatus    stat  on assi.idStatus = stat.idStatus
inner join tblParcelas  parc on parc.idAssinatura = assi.idAssinatura
inner join tblStatus    past  on parc.idStatus = past.idStatus

where prest.idPrestador  = 1