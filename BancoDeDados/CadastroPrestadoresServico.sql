/*
 TheLittleOrange
 Gilberto Anderson
 Cadastro de Prestadores de Servico

*/


   DECLARE 
    @Condominio			varchar(240),
    @Prestador			varchar(240),
	@Fone				varchar(20),
	@Especialidade		varchar(60),
	@Email				varchar(60),
	@idPrestador		int,
	@idEspecialidade	int


		
		set @Condominio	= 'Auguri Residence | Living'
		set @Prestador	= 'Joao Carlos'	
		set @Fone	= '11 9898 7878'
		set @Email = 'JoaoCarlos@pintor.com'
		set @Especialidade = 'PINTOR'

		--...................................... verifica a especialidade
		select @idEspecialidade = idEspecialidade from tblEspecialidade where Descricao = @Especialidade
		


		if(@idEspecialidade is null) begin
		   print 'Especialidade ' +  @Especialidade + ' não encontrada'
		end 
		 else begin
		
			-- ..................................... insere o prestador
			insert into tblPrestador([idCanal], [idAbrangencia], [idStatus],[idCondominio],   [Empresa],  [Celular], [Email])
			values( 1,(select idDominio    from tblDominios   where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
					(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'NOVO'),
				   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
					(select idCondominio from tblCondominio where Nome = @Condominio),
					@Prestador, -- ................. prestador de servico
					@Fone ,
					@Email) -- ................. celular
				   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
			--..................................... vincula a especialidade
			select @idPrestador = idPrestador from tblPrestador where Empresa = @Prestador

			insert into tblPrestadorEspecialidade(idPrestador, idEspecialidade, idStatus) 
			values(	@idPrestador,
					@idEspecialidade,
					(select idStatus   from tblStatus where Objeto = 'PRESTADOR_ESPECIALIDADE' and Descricao = 'ATIVO'))

	    end
	
-- .........................................................................................................................

		set @Condominio	= ''
		set @Prestador	= ''	
		set @Fone	= ''		
		set @Especialidade = ''

		--...................................... verifica a especialidade
		select @idEspecialidade = idEspecialidade from tblEspecialidade where Descricao = @Especialidade

		if(@idEspecialidade is null) begin
		   print 'Especialidade ' & @Especialidade & 'não encontrada'
		end else begin

			-- ..................................... insere o prestador
			insert into tblPrestador([idCanal], [idAbrangencia], [idStatus],[idCondominio],   [Empresa],  [Celular])
			values( 1,(select idDominio    from tblDominios   where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
					(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'NOVO'),
				   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
					(select idCondominio from tblCondominio where Nome = @Condominio),
					@Prestador, -- ................. prestador de servico
					@Fone ) -- ................. celular
				   -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
			--..................................... vincula a especialidade
			select @idPrestador = idPrestador from tblPrestador where Empresa = @Prestador

			insert into tblPrestadorEspecialidade(idPrestador, idEspecialidade) values(@idPrestador,@idEspecialidade)


	    end
		


		