/*
 SCRIPTS PLANOS


*/

-- TELA 01 Lista todas as abrangencias do plano mensal

	SELECT  plab.idPlano, dopl.Descricao 'PLANO',plab.idAbrangencia, doab.Descricao 'ABRANGENCIA', plab.valor, plab.codPlano, plab.linkPagSeguro
	FROM tblPlano_Abrangencia plab
	inner join tblDominios dopl  on dopl.idDominio = plab.idPlano
	inner join tblDominios doab  on doab.idDominio = plab.idAbrangencia
	where dopl.Descricao = 'MENSAL'

	
-- TELA 02 Lista todos os planos da abrangencia escolhida 


	SELECT  plab.idPlano, dopl.Descricao 'PLANO',plab.idAbrangencia, doab.Descricao 'ABRANGENCIA', plab.valor, plab.codPlano, plab.linkPagSeguro
	FROM tblPlano_Abrangencia plab
	inner join tblDominios dopl  on dopl.idDominio = plab.idPlano
	inner join tblDominios doab  on doab.idDominio = plab.idAbrangencia
	where doab.Descricao = 'ESTADO'

-- gera codigo Rastreador
-- 2022A10700000105

select * from tblAssinaturas

declare @idPrestador   int
declare @codPlano      varchar(4)
declare @Rastreador    varchar(18)
declare @strData       varchar(08)

set @idPrestador = 23
set @codPlano = 'AE01' -- codPlano 
set @strData = Convert(varchar,getdate(),112)
set @Rastreador = substring(@strData,1,4) + @codPlano + substring(@strData,7,2)+ FORMAT(@idPrestador, '000000') + substring(@strData,5,2)

print  @Rastreador



