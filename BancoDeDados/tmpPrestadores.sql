/*
 TheLittleOrange
 Gilberto Anderson
 Cadastro de Prestadores de Servico EM LOTE

*/

SET ANSI_PADDING OFF
drop table #tmpPrestadores

CREATE TABLE #tmpPrestadores(
	[condominio]        varchar(240),
	[Empresa]			varchar(240), 
	[Email]				varchar(240),
	[Celular]			varchar(25) ,
	[Especialidade]		varchar(60),
	[Status]	        varchar(30)

)
-- possiveis status
-- novo 
-- importado
-- erro especialidade
-- cadastrado

insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Andreia Medice', '11 99254-3381','Andreia Medice@TESTE.COM','Arquiteto','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Erika Arquiteta', '11 97355-0028','Erika Arquiteta@TESTE.COM','Arquiteto','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Pedro Arquiteta', '11 99964-6467','Pedro Arquiteta@TESTE.COM','Arquiteto','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Edson Mecânico', '11 94883-5519','Edson Mecânico@TESTE.COM','Mecânico','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'HDI Seguros', '11 95915-3148','stecorretoradeseguros@hotmail.com','SEGURO','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Dra Aline Orto', '11 94586-8384','Aline Orto@TESTE.COM','Ortodentista','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Roberta', ' 11 91195-6635','Pediatra Roberta@TESTE.COM','Pediatra','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Dra Jacque', '11 94146-7162','Consultorio JJ Zamboni E Alfa Uro@TESTE.COM','Pediatra','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Assistência Técnica C yrela', '11 94146-7162','Assistência Técnica C yrela@TESTE.COM','Assistência Técnica','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Odair Pedreiro', '11 98669-8613','Odair Pedreiro@TESTE.COM','Pedreiro','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Vagner Pedreiro', ' 11 99948-7946','Vagner Pedreiro@TESTE.COM','Pedreiro','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Cia de Teatro Letra Jovem ', '11 981172969','cialetrajovem.teatro@gmail.com','Teatro','novo')




declare @condominio     varchar(240),
	@Empresa			varchar(240), 
	@Email				varchar(240),
	@Celular			varchar(25) ,
	@Especialidade		varchar(60),
	@Status             varchar(30),
	@idPrestador		int,
	@idEspecialidade	int,
	@sql varchar(240)

declare prestador_cursor cursor for
select [condominio], [Empresa], [Email]	, [Celular]	, [Especialidade]	, [Status]	 from #tmpPrestadores

open prestador_cursor
fetch next from prestador_cursor into @condominio, @Empresa, @Email, @Celular, @Especialidade, @Status 

while @@fetch_status = 0
begin
	print @Empresa +' [' + @Especialidade +'] ' + @Status

	-- atua se status = novo
	if @Status = 'novo' begin
		--...................................... verifica a especialidade
		set @idEspecialidade = null
		select @idEspecialidade = idEspecialidade from tblEspecialidade where Descricao = @Especialidade

		print @idEspecialidade

		if(@idEspecialidade is null) begin
		    print @Especialidade + 'nova'
			insert into tblEspecialidade(Area, Descricao,idStatus, icone) values ('nova', @Especialidade,
					(select idStatus   from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'), 'bi bi-person-badge')
					
			select @idEspecialidade = idEspecialidade from tblEspecialidade where Descricao = @Especialidade
		end 
		
		print @Empresa + ' [' +   @Celular + '] ' + @Email
		set @sql = null

		select @sql = Empresa from tblPrestador where Empresa = @Empresa
				
		if(@sql is null or @sql = '' ) begin
		
			print @Empresa + ' [' +   @Celular + '] ' + @Email
			-- ..................................... insere o prestador
			insert into tblPrestador([idCanal], [idAbrangencia], [idStatus],[idCondominio],   [Empresa],  [Celular], [Email])
			values( 1,(select idDominio    from tblDominios   where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
					(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'Trafego'),
					-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
					(select idCondominio from tblCondominio where Nome = @Condominio),
					@Empresa, -- ................. prestador de servico
					@Celular ,
					@Email) -- ................. celular
					-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
			
			--..................................... vincula a especialidade
			select @idPrestador = idPrestador from tblPrestador where Empresa = @Empresa
			print convert(varchar,@idPrestador) + ' novo id ' + @Empresa
			insert into tblPrestadorEspecialidade(idPrestador, idEspecialidade, idStatus) 
			values(	@idPrestador,
					@idEspecialidade,
					(select idStatus   from tblStatus where Objeto = 'PRESTADOR_ESPECIALIDADE' and Descricao = 'ATIVO'))
			 
			-- atualiza lista de prestadores
			update #tmpPrestadores set Status  = 'cadstrado' where Empresa = @Empresa and condominio = @condominio
		end 

	end 
	fetch next from prestador_cursor into @condominio, @Empresa, @Email, @Celular, @Especialidade, @Status 
	
end
close prestador_cursor
deallocate prestador_cursor

--select * from #tmpPrestadores
--select * from tblEspecialidade order by Area, descricao
--select * from tblPrestador

--delete from tblPrestadorEspecialidade where idPrestador >= 26
--delete from tblPrestador where idPrestador >= 26


--			select * from tblEspecialidade where Descricao = 'Arquiteto'
--			select idEspecialidade from tblEspecialidade where Descricao = 'Arquiteto'

--insert into tblPrestador([idCanal], [idAbrangencia], [idStatus],[idCondominio],   [Empresa],  [Celular], [Email])
--			values( 1,(select idDominio    from tblDominios   where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
--					(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'Trafego'),
--					-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
--					(select idCondominio from tblCondominio where Nome = 'Auguri Residence | Living'),
--					'Erika Arquiteta', -- ................. prestador de servico
--					'11 97355-0028' ,
--					'Erika Arquiteta@TESTE.COM') -- ................. celular


--			select  idPrestador from tblPrestador where Empresa = 'Erika Arquiteta'



--			insert into tblPrestadorEspecialidade(idPrestador, idEspecialidade, idStatus) 
--			values(	27,
--					6,
--					(select idStatus   from tblStatus where Objeto = 'PRESTADOR_ESPECIALIDADE' and Descricao = 'ATIVO'))



