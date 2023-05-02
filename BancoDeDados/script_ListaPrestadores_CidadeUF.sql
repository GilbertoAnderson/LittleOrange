/*
	script_listaprestadorCidadeUF
	script para listar os prestadores da cidade/estado 
	quando não encontrar nennhum prestador no condominio

	Gilberto Anderson
	Outubro 2022

	select * from tblCondominio

*/

Declare @CodigoIBGE			varchar(7),
        @idCondominio		int,
		@sql				varchar(max),
		@qtdePrestadores	int,
		@UF					varchar(2),
		@AbrangenciaCidade  int,
		@AbrangenciaEstado  int
--- teste 1
set @CodigoIBGE = ''
set @idCondominio = null


-- teste 2
set @CodigoIBGE = null
--set @idCondominio = 3  -- Giba
set @idCondominio = 52 -- Luciano
set @idCondominio = 29 -- Naomi

set @idCondominio =  61 -- Gilmar



select @qtdePrestadores = COUNT(1) from tblPrestador where idCondominio = @idCondominio

if @qtdePrestadores = 0 begin
	select @CodigoIBGE = CodigoIBGE, @UF = UF from tblCondominio where idCondominio = @idCondominio	
	select @AbrangenciaCidade = idDominio from tblDominios where Objeto = 'ABRANGENCIA' and Descricao  = 'CIDADE'
	select @AbrangenciaEstado = idDominio from tblDominios where Objeto = 'ABRANGENCIA' and Descricao  = 'ESTADO'
end

set @sql = ''
set @sql = @sql + 'select condo.codigoIBGE ,condo.Nome,  prest.idPrestador,  prest.Empresa, espec.Descricao '
set @sql = @sql + 'from       tblCondominio             condo  '
set @sql = @sql + 'inner join tblPrestador              prest on prest.idCondominio    = condo.idCondominio '
set @sql = @sql + 'inner join tblPrestadorEspecialidade presp on presp.idPrestador     = prest.idPrestador '
set @sql = @sql + 'inner join tblEspecialidade          espec on espec.idEspecialidade = presp.idEspecialidade '


if @qtdePrestadores = 0  begin
	set @sql = @sql + 'inner join tblAssinaturas        assin on assin.idPrestador = prest.idPrestador '
	set @sql = @sql + 'and assin.idStatus = ( select idStatus from tblStatus where Objeto = ''ASSINATURA'' and Descricao = ''ATIVA'')   '
	set @sql = @sql + 'where ((( prest.codigoIBGE   = ''' + @CodigoIBGE + ''' '	
	set @sql = @sql + 'and prest.idAbrangencia = ' + convert(varchar,@AbrangenciaCidade,1) + ') '	
	set @sql = @sql + 'or ( prest.UF = ''' + @UF + ''' ' 
	set @sql = @sql + 'and prest.idAbrangencia = ' + convert(varchar,@AbrangenciaEstado,1) + ')) '
	set @sql = @sql + 'AND prest.idStatus = (select idStatus from tblStatus where Objeto = ''PRESTADOR'' and Descricao = ''ATIVO'') '
	set @sql = @sql + ')'
end else begin
	set @sql = @sql + 'where condo.idCondominio = ' + convert(varchar,@idCondominio) 
end
set @sql = @sql + ' group by condo.Nome, condo.codigoIBGE, prest.idPrestador, prest.Empresa, espec.Descricao '

--print @sql
exec(@sql)



