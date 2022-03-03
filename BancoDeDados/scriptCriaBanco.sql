/*

	criação do banco de dados 
	Gilberto Anderson  
	25 Fevereiro 2022
	Orange@202202

	Data Source=SQL5102.site4now.net;
	Initial Catalog=db_a49cbe_littleorange;
	User Id=db_a49cbe_littleorange_admin;
	Password=Orange@202202
				
*/

----Cria database
-- CREATE DATABASE db_LittleOrange
-- GO




-- Selecina o BD
--USE db_LittleOrange;
--GO

use db_a49cbe_littleorange
go


SET ANSI_PADDING OFF

/*

-- .................................................................... 01 tblStatus
-- .................................................................... 02 tblPerfil
-- .................................................................... 03 tblDominios
-- .................................................................... 04 tblCondominios
-- .................................................................... 05 tblUsuarios
-- .................................................................... 06 tblUsuarioPerfil
-- .................................................................... 07 tblEspecialidade
-- .................................................................... 08 tblPrestador
-- .................................................................... 09 tblPrestadorEspecialidade
-- .................................................................... 10 tblAvaliacao
-- .................................................................... 11 tblAssinaturas
*/






BEGIN-- .......................... apagando todas as tabelas

-- .................................................................... 12 tblCliques
	if Exists(Select name from sysobjects where name='tblCliques')Begin 
		drop table dbo.tblCliques
	End

-- .................................................................... 11 tblAssinaturas
	if Exists(Select name from sysobjects where name='tblAssinaturas')Begin 
		drop table dbo.tblAssinaturas
	End
-- .................................................................... 10 tblAvaliacao
	if Exists(Select name from sysobjects where name='tblAvaliacao')Begin 
		drop table dbo.tblAvaliacao
	End

-- .................................................................... 09 tblPrestadorEspecialidade
	if Exists(Select name from sysobjects where name='tblPrestadorEspecialidade')Begin 
		drop table dbo.tblPrestadorEspecialidade
	End
	
-- .................................................................... 08 tblPrestador
	if Exists(Select name from sysobjects where name='tblPrestador')Begin 
		drop table dbo.tblPrestador
	End
	
-- .................................................................... 07 tblEspecialidade
	if Exists(Select name from sysobjects where name='tblEspecialidade')Begin 
		drop table dbo.tblEspecialidade
	End
	
-- .................................................................... 06 tblUsuarioPerfil
	if Exists(Select name from sysobjects where name='tblUsuarioPerfil')Begin 
		drop table dbo.tblUsuarioPerfil
	End
	
-- .................................................................... 05 tblUsuarios
	if Exists(Select name from sysobjects where name='tblUsuario')Begin 
		drop table dbo.tblUsuario
	End
	
-- .................................................................... 04 tblCondominios
	if Exists(Select name from sysobjects where name='tblCondominio')Begin 
		drop table dbo.tblCondominio
	End
	
-- .................................................................... 03 tblDominios
	if Exists(Select name from sysobjects where name='tblDominios')Begin 
		drop table dbo.tblDominios
	End	
	
-- .................................................................... 02 tblPerfil
	if Exists(Select name from sysobjects where name='tblPerfil')Begin 
		drop table dbo.tblPerfil
	End

-- .................................................................... 01 tblStatus
	if Exists(Select name from sysobjects where name='tblStatus')Begin 
	 	drop table dbo.tblStatus
	End	

END



--........................... criando as tabelas
BEGIN  


-- .................................................................... 01 tblStatus
begin	
	if Exists(Select name from sysobjects where name='tblStatus')Begin 
		drop table dbo.tblStatus
	End	

  	CREATE TABLE dbo.tblStatus(
		[idStatus]		int 	IDENTITY(1,1) NOT NULL,
		[Objeto]		VARCHAR(30),
		[Descricao]		VARCHAR(30),
		-- log de alteracao
		DtCriacao		DATETIME,
		DtAtualizacao	DATETIME,
		idAlteracao		INT,

		CONSTRAINT [pk_Status] PRIMARY KEY CLUSTERED 
		(
			[idStatus] ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]

		
		CREATE INDEX idx_Status
		ON tblStatus ([Descricao]);
	 

	 
-- .................................................................... 02 tblPerfil	
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PERFIL','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PERFIL','INATIVO', GETDATE(), 1)
	
-- .................................................................... 04 tblCondominios
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('CONDOMINIO','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('CONDOMINIO','INATIVO', GETDATE(), 1)
	
-- .................................................................... 05 tblUsuarios
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('USUARIO','NOVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('USUARIO','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('USUARIO','INATIVO', GETDATE(), 1)	
	
-- .................................................................... 06 tblUsuarioPerfil
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('USUARIO_PERFIL','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('USUARIO_PERFIL','INATIVO', GETDATE(), 1)
	
-- .................................................................... 07 tblEspecialidade
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('ESPECIALIDADE','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('ESPECIALIDADE','INATIVO', GETDATE(), 1)

-- .................................................................... 08 tblPrestador
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR','INATIVO', GETDATE(), 1)
	
-- .................................................................... 09 tblPrestadorEspecialidade
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR_ESPECIALIDADE','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR_ESPECIALIDADE','INATIVO', GETDATE(), 1)

-- .................................................................... 10 tblAvaliacao
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('AVALIACAO','APROVADA', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('AVALIACAO','EM ANALISE', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('AVALIACAO','CONTESTADA', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('AVALIACAO','REPROVADA', GETDATE(), 1)

-- .................................................................... 11 tblAssinaturas
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('ASSINATURA','ENTRAR EM CONTATO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('ASSINATURA','EM NEGOCIACAO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('ASSINATURA','ATIVA', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('ASSINATURA','CANCELADA', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('ASSINATURA','ATRASADA', GETDATE(), 1)		

-- .................................................................... 12 tblClique
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('CLIQUE','VALIDO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('CLIQUE','INVALIDO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('CLIQUE','EM ANALISE', GETDATE(), 1)
	
end


-- .................................................................... 02 tblPerfil
begin		
	if Exists(Select name from sysobjects where name='tblPerfil')Begin 
		drop table dbo.tblPerfil
	End
	
	create table dbo.tblPerfil(
		[idPerfil]		int identity(1,1) not null,
		[Descricao]		varchar(020)      not null,
		[idStatus]		int,
		CONSTRAINT [PK_tblPerfil] PRIMARY KEY CLUSTERED 
		(
			[idPerfil] ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]

	
	ALTER TABLE dbo.tblPerfil
	ADD CONSTRAINT fk_tblPerfilStatus
	FOREIGN KEY (idStatus)
	REFERENCES tblStatus(idStatus)
	
	
	insert into tblPerfil(Descricao, idStatus ) values('ADM',         (select idStatus from tblStatus where Objeto= 'PERFIL' and Descricao = 'ATIVO' ))
	insert into tblPerfil(Descricao, idStatus ) values('MORADOR',     (select idStatus from tblStatus where Objeto= 'PERFIL' and Descricao = 'ATIVO' ))
	insert into tblPerfil(Descricao, idStatus ) values('CANAL'  ,     (select idStatus from tblStatus where Objeto= 'PERFIL' and Descricao = 'ATIVO' ))
	insert into tblPerfil(Descricao, idStatus ) values('PRESTADOR',   (select idStatus from tblStatus where Objeto= 'PERFIL' and Descricao = 'ATIVO' ))
	insert into tblPerfil(Descricao, idStatus ) values('DIR_CANAIS',  (select idStatus from tblStatus where Objeto= 'PERFIL' and Descricao = 'ATIVO' ))
	insert into tblPerfil(Descricao, idStatus ) values('DIR_FINANCAS',(select idStatus from tblStatus where Objeto= 'PERFIL' and Descricao = 'ATIVO' ))

end


-- .................................................................... 03 tblDominios
begin	 
	
	if Exists(Select name from sysobjects where name='tblDominios')Begin 
		drop table dbo.tblDominios
	End	
	
  	CREATE TABLE dbo.tblDominios(
		idDominio		int 	IDENTITY(1,1) NOT NULL,
		Objeto			VARCHAR(20),
		Codigo			VARCHAR(3),
		Descricao		VARCHAR(50),

		CONSTRAINT [pk_Dominio] PRIMARY KEY CLUSTERED 
		(
			idDominio ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]


		
		CREATE INDEX idx_Dominio
		ON tblDominios ([Descricao]);
	 
    
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ABRANGENCIA','01','CONDOMINIO')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ABRANGENCIA','02','CIDADE')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ABRANGENCIA','03','ESTADO')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ABRANGENCIA','03','REGIAO')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ABRANGENCIA','04','PAIS')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ABRANGENCIA','05','CONTINENTAL')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ABRANGENCIA','06','MUNDIAL')

	
	
end


-- .................................................................... 04 tblCondominios
begin	
	
		if Exists(Select name from sysobjects where name='tblCondominio')Begin 
			drop table dbo.tblCondominio
		End
		
		create table dbo.tblCondominio(
		[idCondominio]	int identity(1,1) not null,
		[Nome]			varchar(240),
		[Endereco]		varchar(240),
		[Complemento]	varchar(100),
		[Bairro]		varchar(160),
		[Cidade]		varchar(160),
		[UF]			varchar(2),
		[Pais]			varchar(60),
		[CEP]			varchar(10),
		[Fone]			varchar(20),
		[CodigoIBGE]	varchar(7),
		Latitude		decimal(9,7),
		Longitude		decimal(9,7),
		[idStatus]		int,
		
		CONSTRAINT [PK_tblCondominio] PRIMARY KEY CLUSTERED 
		(
			[idCondominio]	  ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]
		

		
		ALTER TABLE dbo.tblCondominio
		ADD CONSTRAINT fk_tblCondominioStatus
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)

		
		CREATE INDEX idx_Condominio
		ON tblCondominio ([Nome]);

		/*
		  ao cadastrar um condominio o app deve pegar o cep e localizar atraves de APIs
		  o endereco, tambem deve gravar latitude , longitude e o codigo ibge da cidade
		
		
		*/
		
		-- condominio 01
		insert into tblCondominio([Nome], [Endereco], [Complemento], [Bairro], [Cidade], [UF], [Pais], [CEP], [Fone], [CodigoIBGE], [Latitude], [Longitude], [idStatus]) 
		values( 'Desenvolve Brasil',
		        ' ',
		        '',
		        '',
		        '',
		        'SP',
				'Brasil',
		        '',
				'',
				'',
				0,
				0,
				(select idStatus from tblStatus where Objeto = 'CONDOMINIO' and Descricao = 'ATIVO'))


		insert into tblCondominio([Nome], [Endereco], [Complemento], [Bairro], [Cidade], [UF], [Pais], [CEP], [Fone], [CodigoIBGE], [Latitude], [Longitude], [idStatus]) 
		values( 'Condomínio Villa Verde',
		        'R. Continental, 663 ',
		        '',
		        'Jardim do Mar',
		        'São Bernardo do Campo',
		        'SP',
				'Brasil',
		        '09726-410',
				'(11) 4461-5680',
				'3548708',
				-23.6853755,
				-46.560448,
				(select idStatus from tblStatus where Objeto = 'CONDOMINIO' and Descricao = 'ATIVO'))
		
		insert into tblCondominio([Nome], [Endereco], [Complemento], [Bairro], [Cidade], [UF], [Pais], [CEP], [Fone], [CodigoIBGE], [Latitude], [Longitude], [idStatus]) 
		values( 'Auguri Residence | Living',
		        'Rua Comendador Carlo Mário Gardano, 203 ',
		        '',
		        'Centro',
		        'São Bernardo do Campo',
		        'SP',
				'Brasil',
		        '09720-470',
				'(11) 4502-3456',
				'3548708',
				-23.7181695,
				-46.5548969,
				(select idStatus from tblStatus where Objeto = 'CONDOMINIO' and Descricao = 'ATIVO'))
		
	
		insert into tblCondominio([Nome], [Endereco], [Complemento], [Bairro], [Cidade], [UF], [Pais], [CEP], [Fone], [CodigoIBGE], [Latitude], [Longitude], [idStatus]) 
		values( 'Helbor Family Garden',
		        'Av. das Nações Unidas, 1515',
		        '',
		        'Chácara Inglesa',
		        'São Bernardo do Campo',
		        'SP',
				'Brasil',
		        '09726-110',
				'(11) 3674-5500',
				'3548708',
				-23.6908758,
				-46.560246,
				(select idStatus from tblStatus where Objeto = 'CONDOMINIO' and Descricao = 'ATIVO'))
		

end


-- .................................................................... 05 tblUsuarios
begin	 
 
	
	if Exists(Select name from sysobjects where name='tblUsuario')Begin 
		drop table dbo.tblUsuario
	End
	
	create table dbo.tblUsuario(
		[idUsuario]			int identity(1,1) not null,
		[idCondominio]		int not null,
		[Nome]				varchar(240)      not null,
		[Email]				varchar(240)      not null,
		[Senha]				varchar(020)      not null,
		[Celular]			varchar(025)      not null,
		[dtNascimento]		datetime,
		[CPF_CNPJ]		    varchar(014),
		[idStatus]			int,
		CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
		(
			[idUsuario] ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]
	
	
		CREATE INDEX idx_Usuario
		ON tblUsuario ([Nome]);

		CREATE INDEX idx_UsuarioEmail
		ON tblUsuario ([Email]);
				
		ALTER TABLE dbo.tblUsuario
		ADD CONSTRAINT fk_tblUsuarioStatus
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)
		
		
		ALTER TABLE dbo.tblUsuario
		ADD CONSTRAINT fk_tblUsuarioCondominio
		FOREIGN KEY (idCondominio)
		REFERENCES tblCondominio(idCondominio)
		

		insert into tblUsuario(Email, idCondominio, Nome, Senha, Celular, idStatus)
		values('gilberto.anderson@gmail.com',1, 'Gilberto Anderson','segredo','11 9898 8989',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		
		-- cadastro de morados, 1 para cada condominio
		insert into tblUsuario(Email,idCondominio, Nome, Senha, Celular, idStatus)
		values('morador01@teste.com',2, 'Morador 01 Teste','segredo','11 9898 8989',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		
		
		insert into tblUsuario(Email,idCondominio, Nome, Senha, Celular, idStatus)
		values('morador02@teste.com',3, 'Morador 02 Teste','segredo','11 9898 8989',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		
		
		insert into tblUsuario(Email,idCondominio, Nome, Senha, Celular, idStatus)
		values('morador03@teste.com',4, 'Morador 03 Teste','segredo','11 9898 8989',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		
		
		-- cadastro do canal do condominio 01
		insert into tblUsuario(Email, idCondominio, Nome, Senha, Celular,  idStatus)
		values('canal01@teste.com', 2, 'Canal 01 Teste','segredo', '11 9898 8989',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		

		-- cadastro do canal do condominio 02
		insert into tblUsuario(Email, idCondominio, Nome, Senha, Celular,  idStatus)
		values('canal02@teste.com', 3, 'Canal 02 Teste','segredo', '11 9898 8989',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		

		-- cadastro do prestador condominio 01
		insert into tblUsuario(Email,idCondominio, Nome, Senha, Celular,  idStatus)
		values('prestador01@teste.com',2, 'Prestador 01 Teste','segredo', '11 9898 8989',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		
		
		-- cadastro do prestador condominio 02
		insert into tblUsuario(Email,idCondominio, Nome, Senha, Celular,  idStatus)
		values('prestador02@teste.com',3, 'Prestador 02 Teste','segredo', '11 9898 8989',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		

		-- cadastro do prestador condominio 03
		insert into tblUsuario(Email,idCondominio, Nome, Senha, Celular,  idStatus)
		values('prestador03@teste.com',4, 'Prestador 03 Teste','segredo', '11 9898 8989',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		      
end


-- .................................................................... 06 tblUsuarioPerfil
begin	 
	
		if Exists(Select name from sysobjects where name='tblUsuarioPerfil')Begin 
			drop table dbo.tblUsuarioPerfil
		End
		
		create table dbo.tblUsuarioPerfil(
		[idUsuario]		int not null,
		[idPerfil]		int not null,
		[idStatus]		int not null,
		[dtValidade]	datetime,
		
		CONSTRAINT [PK_tblCemiterio] PRIMARY KEY CLUSTERED 
		(
			[idUsuario],[idPerfil]   ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]
		
		
		
		ALTER TABLE dbo.tblUsuarioPerfil
		ADD CONSTRAINT fk_tblUsuarioPerfil_Perfil
		FOREIGN KEY (idPerfil)
		REFERENCES tblPerfil(idPerfil)
	
		
		ALTER TABLE dbo.tblUsuarioPerfil
		ADD CONSTRAINT fk_tblUsuarioPerfil_Usuario
		FOREIGN KEY (idUsuario)
		REFERENCES tblUsuario(idUsuario)

		ALTER TABLE dbo.tblUsuarioPerfil
		ADD CONSTRAINT fk_tblUsuarioPerfil_Status
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)
		
		-- cadastro usuario perfil ADM
		insert into tblUsuarioPerfil(idUsuario, idPerfil, [idStatus], [dtValidade]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Gilberto Anderson'),
				(select idPerfil  from tblPerfil  where Descricao = 'ADM'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_PERFIL' and Descricao = 'ATIVO'),
				dateadd(month,3,GETDATE()))

		
		-- cadastro usuario perfil morador
		insert into tblUsuarioPerfil(idUsuario, idPerfil, [idStatus], [dtValidade]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Morador 01 Teste'),
				(select idPerfil  from tblPerfil  where Descricao = 'MORADOR'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_PERFIL' and Descricao = 'ATIVO'),
				dateadd(month,3,GETDATE()))


		insert into tblUsuarioPerfil(idUsuario, idPerfil, [idStatus], [dtValidade]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Morador 02 Teste'),
				(select idPerfil  from tblPerfil  where Descricao = 'MORADOR'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_PERFIL' and Descricao = 'ATIVO'),
				dateadd(month,3,GETDATE()))

				
		insert into tblUsuarioPerfil(idUsuario, idPerfil, [idStatus], [dtValidade]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Morador 03 Teste'),
				(select idPerfil  from tblPerfil  where Descricao = 'MORADOR'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_PERFIL' and Descricao = 'ATIVO'),
				dateadd(month,3,GETDATE()))
		
		-- cadastro usuario perfil canal
	
		insert into tblUsuarioPerfil(idUsuario, idPerfil, [idStatus], [dtValidade]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Canal 01 Teste'),
				(select idPerfil  from tblPerfil  where Descricao = 'CANAL'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_PERFIL' and Descricao = 'ATIVO'),
				dateadd(month,3,GETDATE()))	

		insert into tblUsuarioPerfil(idUsuario, idPerfil, [idStatus], [dtValidade]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Canal 02 Teste'),
				(select idPerfil  from tblPerfil  where Descricao = 'CANAL'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_PERFIL' and Descricao = 'ATIVO'),
				dateadd(month,3,GETDATE()))	

		-- cadastro usuario perfil prestador
		insert into tblUsuarioPerfil(idUsuario, idPerfil, [idStatus], [dtValidade]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Prestador 01 Teste'),
				(select idPerfil  from tblPerfil  where Descricao = 'PRESTADOR'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_PERFIL' and Descricao = 'ATIVO'),
				dateadd(month,3,GETDATE()))	

		insert into tblUsuarioPerfil(idUsuario, idPerfil, [idStatus], [dtValidade]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Prestador 02 Teste'),
				(select idPerfil  from tblPerfil  where Descricao = 'PRESTADOR'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_PERFIL' and Descricao = 'ATIVO'),
				dateadd(month,3,GETDATE()))	
       
		insert into tblUsuarioPerfil(idUsuario, idPerfil, [idStatus], [dtValidade]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Prestador 03 Teste'),
				(select idPerfil  from tblPerfil  where Descricao = 'PRESTADOR'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_PERFIL' and Descricao = 'ATIVO'),
				dateadd(month,3,GETDATE()))	

end


-- .................................................................... 07 tblEspecialidade
begin

		
		if Exists(Select name from sysobjects where name='tblEspecialidade')Begin 
			drop table dbo.tblEspecialidade
		End
		
		create table dbo.tblEspecialidade(
		[idEspecialidade]	int identity(1,1) not null,
		[Area]				varchar(30),
		[Especialidade]		varchar(60),
		[idStatus]			int not null,
		
		CONSTRAINT [PK_tblEspecialidade] PRIMARY KEY CLUSTERED 
		(
			idEspecialidade   ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]
		

		ALTER TABLE dbo.tblEspecialidade
		ADD CONSTRAINT fk_tblEspecialidadeStatus
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)
			
			
		-- cadastro especialidade
		insert into tblEspecialidade(Area, Especialidade, idStatus) 
		values('PETS','VETERINARIO', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))

		insert into tblEspecialidade(Area, Especialidade, idStatus) 
		values('LIMPEZA','DIARISTA', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
		
		insert into tblEspecialidade(Area, Especialidade, idStatus) 
		values('CONSTRUCAO','PINTOR', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))

		insert into tblEspecialidade(Area, Especialidade, idStatus) 
		values('CONSTRUCAO','ARQUITETO', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))

		insert into tblEspecialidade(Area, Especialidade, idStatus) 
		values('CONSTRUCAO','ELETRICISTA', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
		
		
end


-- .................................................................... 08 tblPrestador
begin 
	
	if Exists(Select name from sysobjects where name='tblPrestador')Begin 
		drop table dbo.tblPrestador
	End
	
	create table dbo.tblPrestador(
		[idPrestador]		int identity(1,1) not null,
		[idCondominio]		int not null,
		[idCanal]			int not null,
		[idAbrangencia]		int not null,
		[Empresa]			varchar(240)      not null,
		[Endereco]			varchar(240),
		[Complemento]		varchar(100),
		[Bairro]			varchar(160),
		[Cidade]			varchar(160),
		[UF]				varchar(2),
		[Pais]				varchar(60),
		[CEP]				varchar(10),
		[CodigoIBGE]		varchar(7),
		[Email]				varchar(240)     not null,
		[Celular]			varchar(25)      not null,
		[CPF_CNPJ]		    varchar(014)     , -- CPF: 04305254867 11 casas CNPJ: XX. XXX. XXX/0001-XX
		[Fone]				varchar(20),
		Latitude			decimal(9,7),
		Longitude			decimal(9,7),
		[QtdeAvaliacao]		int,
		[NotaAvaliacao]		decimal(3,1),
		[idStatus]			int,
		CONSTRAINT [PK_tblPrestador] PRIMARY KEY CLUSTERED 
		(
			[idPrestador] ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]
		
	
		CREATE INDEX idx_Prestador
		ON tblPrestador ([Empresa]);

				
		ALTER TABLE dbo.tblPrestador
		ADD CONSTRAINT fk_tblPrestadorStatus
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)
		
		
		ALTER TABLE dbo.tblPrestador
		ADD CONSTRAINT fk_tblPrestadorCondominio
		FOREIGN KEY (idCondominio)
		REFERENCES tblCondominio(idCondominio)
		
		
		ALTER TABLE dbo.tblPrestador
		ADD CONSTRAINT fk_tblPrestadorCanal
		FOREIGN KEY (idCanal)
		REFERENCES tblUsuario(idUsuario)
		
		ALTER TABLE dbo.tblPrestador
		ADD CONSTRAINT fk_tblPrestadorAbrangencia
		FOREIGN KEY ([idAbrangencia])
		REFERENCES tblDominios(idDominio)
	
	    /*

		  ao cadastrar um prestador o app deve pegar o cep e localizar atraves de APIs
		  o endereco, tambem deve gravar latitude , longitude e o codigo ibge da cidade
		
		*/




		insert into tblPrestador([idCondominio],  [idAbrangencia], [Empresa], [idCanal],  [Endereco],[Complemento],
									[Bairro], [Cidade],[UF], [Pais], [CEP], [Fone], [Celular],[cpf_cnpj], [CodigoIBGE], Latitude,
									Longitude,[Email],[idStatus])
		values(  1, 
				(select idDominio from tblDominios where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
				'Gatto de Botas',
				(select idUsuario from tblUsuario where Nome      = 'Morador 01 Teste'),
				'R. Esperico, 74 ',
		        '',
		        'Jardim do Mar',
		        'São Bernardo do Campo',
		        'SP',
				'Brasil',
		        ' 09750-310',
				'11 41775596',
				'11 41775596',
				'12535141000198',
				'3548708',
				-23.6879702,
				-46.5593572,
				'contato@gattodebotas.com',
				(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'ATIVO'))
		

				insert into tblPrestador([idCondominio], [idAbrangencia], [Empresa], [idCanal], [Endereco],[Complemento],
									[Bairro], [Cidade],[UF], [Pais], [CEP], [Fone], [Celular],[cpf_cnpj], [CodigoIBGE], Latitude,
									Longitude,[Email],[idStatus])
				values(  1, 
				(select idDominio from tblDominios where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
				'Hospital Veterinário Cão Bernardo',
				(select idUsuario from tblUsuario where Nome      = 'Morador 03 Teste'),
				'Rua Municipal, 140 ',
		        '',
		        'Centro',
		        'São Bernardo do Campo',
		        'SP',
				'Brasil',
		        '09710-210',
				'(11) 4930-4561',
				'(11) 4930-4561',
				'20955677000190',
				'3548708',
				-23.7113035,
				-46.5474405,
				'hospitalsbc@caobernardo.com.br',
				(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'ATIVO'))
		


		insert into tblPrestador([idCondominio], [idAbrangencia], [Empresa], [idCanal], [Endereco],[Complemento],
									[Bairro], [Cidade],[UF], [Pais], [CEP], [Fone], [Celular],[cpf_cnpj], [CodigoIBGE], Latitude,
									Longitude,[Email],[idStatus])
				values(  1, 
				(select idDominio from tblDominios where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
				'Total Vet',
				(select idUsuario from tblUsuario where Nome      = 'Morador 03 Teste'),
				'Av. Turmalina, 133',
		        '',
		        'Aclimação',
		        'São Paulo',
		        'SP',
				'Brasil',
		        '01531-020',
				'(11) 3209-4624',
				'(11) 3209-4624',
				'8652775000153',
				'3550308',
				-23.5710487,
				-46.6312208,
				'adm@totalvet.com.br',
				(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'ATIVO'))
		

		insert into tblPrestador([idCondominio], [idAbrangencia], [Empresa], [idCanal], [Endereco],[Complemento],
									[Bairro], [Cidade],[UF], [Pais], [CEP], [Fone], [Celular],[cpf_cnpj], [CodigoIBGE], Latitude,
									Longitude,[Email],[idStatus])
				values(  1, 
				(select idDominio from tblDominios where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
				'Hospital Veterinário Quatro Patas',
				(select idUsuario from tblUsuario where Nome      = 'Morador 03 Teste'),
				'Estr. das Lágrimas, 866',
		        '',
		        'Jardim Sao Caetano',
		        ' São Caetano do Sul ',
		        'SP',
				'Brasil',
		        '09581-360',
				'(11) 4238-33374',
				'(11) 4238-3337',
				'34537160000196',
				'3548807',
				-23.5710487,
				-46.6312208,
				'adm@totalvet.com.br',
				(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'ATIVO'))
		


end


-- .................................................................... 09 tblPrestadorEspecialidade
begin 


		if Exists(Select name from sysobjects where name='tblPrestadorEspecialidade')Begin 
			drop table dbo.tblPrestadorEspecialidade
		End
		
		create table dbo.tblPrestadorEspecialidade(
		[idPrestador]		int not null,
		[idEspecialidade]	int not null,
		[idStatus]			int not null,
		[dtValidade]		datetime,
		
		CONSTRAINT [PK_tblPrestadorEspecialidade] PRIMARY KEY CLUSTERED 
		(
			[idPrestador],[idEspecialidade]   ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]
		
		
		ALTER TABLE dbo.tblPrestadorEspecialidade
		ADD CONSTRAINT fk_tblPrestadorEspecialidade_Prestador
		FOREIGN KEY (idPrestador)
		REFERENCES tblPrestador(idPrestador)

		
		ALTER TABLE dbo.tblPrestadorEspecialidade
		ADD CONSTRAINT fk_tblPrestadorEspecialidade_Especialidade
		FOREIGN KEY (idEspecialidade)
		REFERENCES tblEspecialidade(idEspecialidade)


		ALTER TABLE dbo.tblPrestadorEspecialidade
		ADD CONSTRAINT fk_tblPrestadorEspecialidad_Status
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)


		INSERT INTO tblPrestadorEspecialidade([idPrestador], [idEspecialidade], [idStatus]	,[dtValidade])
		VALUES (
		
				(select idPrestador     from tblPrestador     where Empresa = 'Gatto de Botas'),
				(select idEspecialidade from tblEspecialidade where Especialidade = 'VETERINARIO'),
				(select idStatus        from tblStatus        where Objeto = 'PRESTADOR_ESPECIALIDADE' and Descricao = 'ATIVO'),
				dateadd(month,6,GETDATE())
		
		)	
		
		INSERT INTO tblPrestadorEspecialidade([idPrestador], [idEspecialidade], [idStatus]	,[dtValidade])
		VALUES (
		
				(select idPrestador     from tblPrestador     where Empresa = 'Hospital Veterinário Cão Bernardo'),
				(select idEspecialidade from tblEspecialidade where Especialidade = 'VETERINARIO'),
				(select idStatus        from tblStatus        where Objeto = 'PRESTADOR_ESPECIALIDADE' and Descricao = 'ATIVO'),
				dateadd(month,6,GETDATE())
		
		)	
		
		INSERT INTO tblPrestadorEspecialidade([idPrestador], [idEspecialidade], [idStatus]	,[dtValidade])
		VALUES (
		
				(select idPrestador     from tblPrestador     where Empresa = 'Total Vet'),
				(select idEspecialidade from tblEspecialidade where Especialidade = 'VETERINARIO'),
				(select idStatus        from tblStatus        where Objeto = 'PRESTADOR_ESPECIALIDADE' and Descricao = 'ATIVO'),
				dateadd(month,6,GETDATE())
		
		)	

		INSERT INTO tblPrestadorEspecialidade([idPrestador], [idEspecialidade], [idStatus]	,[dtValidade])
		VALUES (
		
				(select idPrestador     from tblPrestador     where Empresa = 'Hospital Veterinário Quatro Patas'),
				(select idEspecialidade from tblEspecialidade where Especialidade = 'VETERINARIO'),
				(select idStatus        from tblStatus        where Objeto = 'PRESTADOR_ESPECIALIDADE' and Descricao = 'ATIVO'),
				dateadd(month,6,GETDATE())
		
		)	
		

end


-- .................................................................... 10 tblAvaliacao
begin 

		if Exists(Select name from sysobjects where name='tblAvaliacao')Begin 
			drop table dbo.tblAvaliacao
		End
		
		create table dbo.tblAvaliacao(
		[idAvaliacao]		int identity(1,1) not null,
		[idPrestador]		int not null,
		[idMorador]			int not null,
		[idStatus]			int not null,
		[dtAvaliacao]		datetime,
		[NotaAvaliacao]		int,
		[Mensagem]			varchar(250),
		
		CONSTRAINT [PK_tblAvaliacao] PRIMARY KEY CLUSTERED 
		(
			[idAvaliacao],[idPrestador],[idMorador]  ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]
		
		
		ALTER TABLE dbo.tblAvaliacao
		ADD CONSTRAINT fk_tblAvaliacao_Prestador
		FOREIGN KEY (idPrestador)
		REFERENCES tblPrestador(idPrestador)

		
		ALTER TABLE dbo.tblAvaliacao
		ADD CONSTRAINT fk_tblAvaliacao_Morador
		FOREIGN KEY ([idMorador])
		REFERENCES tblUsuario([idUsuario])
		

		ALTER TABLE dbo.tblAvaliacao
		ADD CONSTRAINT fk_tblAvaliacao_Status
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)



		insert into tblAvaliacao([idPrestador],[idMorador],[idStatus],[dtAvaliacao],[NotaAvaliacao],[Mensagem])
		values(
		        (select idPrestador from tblPrestador where Empresa = 'Gatto de Botas'),				
				(select idUsuario   from tblUsuario   where Nome    = 'Morador 01 Teste'),
				(select idStatus    from tblStatus    where Objeto  = 'AVALIACAO' and Descricao = 'APROVADA'),
				getdate(),
				4,
				'Utilizei o serviço Fui muito bem atenmdido'
		)

		
		insert into tblAvaliacao([idPrestador],[idMorador],[idStatus],[dtAvaliacao],[NotaAvaliacao],[Mensagem])
		values(
		        (select idPrestador from tblPrestador where Empresa = 'Gatto de Botas'),				
				(select idUsuario   from tblUsuario   where Nome    = 'Morador 01 Teste' ),
				(select idStatus    from tblStatus    where Objeto  = 'AVALIACAO' and Descricao = 'APROVADA'),
				getdate(),
				5,
				'Adotei um filhote com eles, super carinhosos'
		)

		--- para caluclar a nota final do prestador, rodar a formula abaixo a cada nova avaliação
		declare 
			@totalAvaliacoes	int,
			@somaNotas			int,
			@Resultado			decimal(3,1)

		select  @totalAvaliacoes = count(1),
			    @somaNotas = sum([NotaAvaliacao])
		from tblAvaliacao 
		where idPrestador = (select idPrestador from tblPrestador where Empresa = 'Gatto de Botas')

		update tblPrestador
		set  [QtdeAvaliacao]	=	@totalAvaliacoes,
		     [NotaAvaliacao]	=	@somaNotas / @totalAvaliacoes
		where idPrestador = (select idPrestador from tblPrestador where Empresa = 'Gatto de Botas')




end


-- .................................................................... 11 tblAssinaturas
begin 

		if Exists(Select name from sysobjects where name='tblAssinaturas')Begin 
			drop table dbo.tblAssinaturas
		End
		
		create table dbo.tblAssinaturas(
		[idAssinatura]		int identity(1,1) not null,
		[idPrestador]		int not null,
		[idCanal]			int not null,
		[idAbrangencia]		int not null,
		[idStatus]			int not null,
		[dtInicio]			datetime,
		[dtTermino]			datetime,
		[ValorContrato]		decimal(18,2),
		[DiaPagamento]		int,
		[Log]				varchar(max),
		
		CONSTRAINT [PK_tblAssinaturas] PRIMARY KEY CLUSTERED 
		(
			[idAssinatura],[idPrestador] ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]


		ALTER TABLE dbo.tblAssinaturas
		ADD CONSTRAINT fk_tblAssinaturas_Status
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)
		
		ALTER TABLE dbo.tblAssinaturas
		ADD CONSTRAINT fk_tblAssinaturas_Prestador
		FOREIGN KEY (idPrestador)
		REFERENCES tblPrestador(idPrestador)
				
		ALTER TABLE dbo.tblAssinaturas
		ADD CONSTRAINT fk_tblAssinaturas_Canal
		FOREIGN KEY ([idCanal])
		REFERENCES tblUsuario([idUsuario])
		
		ALTER TABLE dbo.tblAssinaturas
		ADD CONSTRAINT fk_tblAssinaturas_Abrangencia
		FOREIGN KEY ([idAbrangencia])
		REFERENCES tblDominios([idDominio])


		insert into tblAssinaturas([idPrestador],[idCanal],[idAbrangencia],[idStatus],[dtInicio],[dtTermino],[ValorContrato],[DiaPagamento],[Log])
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Gatto de Botas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Canal 01 Teste' ),
				(select idDominio     from tblDominios  where Objeto  = 'ABRANGENCIA' and Descricao = 'CIDADE'),
				(select idStatus      from tblStatus    where Objeto  = 'ASSINATURA'   and Descricao = 'ATIVA'),
				getdate(),
				dateadd(month,6,GETDATE()),
				30.00,
				10,
				'15/03/2022 assinatura contrato Carol '		
		)

		
		
		
		insert into tblAssinaturas([idPrestador],[idCanal],[idAbrangencia],[idStatus],[dtInicio],[dtTermino],[ValorContrato],[DiaPagamento],[Log])
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Cão Bernardo'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Canal 01 Teste' ),
				(select idDominio     from tblDominios  where Objeto  = 'ABRANGENCIA' and Descricao = 'CIDADE'),
				(select idStatus      from tblStatus    where Objeto  = 'ASSINATURA'   and Descricao = 'ENTRAR EM CONTATO'),
				getdate(),
				dateadd(month,6,GETDATE()),
				25.00,
				10,
				'15/03/2022 assinatura contrato Carol '		
		)
		
		insert into tblAssinaturas([idPrestador],[idCanal],[idAbrangencia],[idStatus],[dtInicio],[dtTermino],[ValorContrato],[DiaPagamento],[Log])
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Total Vet'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Canal 01 Teste' ),
				(select idDominio     from tblDominios  where Objeto  = 'ABRANGENCIA' and Descricao = 'ESTADO'),
				(select idStatus      from tblStatus    where Objeto  = 'ASSINATURA'   and Descricao = 'EM NEGOCIACAO'),
				getdate(),
				dateadd(month,6,GETDATE()),
				50.00,
				15,
				'15/03/2022 assinatura contrato Carol '		
		)

		
		insert into tblAssinaturas([idPrestador],[idCanal],[idAbrangencia],[idStatus],[dtInicio],[dtTermino],[ValorContrato],[DiaPagamento],[Log])
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Canal 01 Teste' ),
				(select idDominio     from tblDominios  where Objeto  = 'ABRANGENCIA' and Descricao = 'CIDADE'),
				(select idStatus      from tblStatus    where Objeto  = 'ASSINATURA'   and Descricao = 'ATRASADA'),
				getdate(),
				dateadd(month,6,GETDATE()),
				25.00,
				20,
				'15/03/2022 assinatura contrato Carol '		
		)
		
end

-- .................................................................... 12 tblCliques
begin 

		if Exists(Select name from sysobjects where name='tblCliques')Begin 
			drop table dbo.tblCliques
		End
		
		create table dbo.tblCliques(
		[idClique]			int identity(1,1) not null,
		[idPrestador]		int not null,
		[idMorador]			int not null,
		[dtClique]			datetime,
		[idStatus]			int not null,
		
		CONSTRAINT [PK_tblCliques] PRIMARY KEY CLUSTERED 
		(
			[idClique] ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]


		ALTER TABLE dbo.tblCliques
		ADD CONSTRAINT fk_tblCliques_Status
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)
		
		ALTER TABLE dbo.tblCliques
		ADD CONSTRAINT fk_tblCliques_Prestador
		FOREIGN KEY (idPrestador)
		REFERENCES tblPrestador(idPrestador)

		
		ALTER TABLE dbo.tblCliques
		ADD CONSTRAINT fk_tblCliques_Morador
		FOREIGN KEY (idMorador)
		REFERENCES tblUsuario(idUsuario)
				

		insert into tblCliques([idPrestador],[idMorador], [dtClique], [idStatus])		
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Canal 01 Teste' ),
				getdate(),	
				(select idStatus      from tblStatus    where Objeto  = 'CLIQUE'   and Descricao = 'VALIDO')
		)

		
		insert into tblCliques([idPrestador],[idMorador], [dtClique], [idStatus])		
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Canal 01 Teste' ),
				getdate(),	
				(select idStatus      from tblStatus    where Objeto  = 'CLIQUE'   and Descricao = 'EM ANALISE')
		)

		
		insert into tblCliques([idPrestador],[idMorador], [dtClique], [idStatus])		
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Canal 01 Teste' ),
				getdate(),	
				(select idStatus      from tblStatus    where Objeto  = 'CLIQUE'   and Descricao = 'INVALIDO')
		)
		
		insert into tblCliques([idPrestador],[idMorador], [dtClique], [idStatus])		
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Morador 01 Teste' ),
				getdate(),	
				(select idStatus      from tblStatus    where Objeto  = 'CLIQUE'   and Descricao = 'VALIDO')
		)

		
		insert into tblCliques([idPrestador],[idMorador], [dtClique], [idStatus])		
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Morador 02 Teste' ),
				getdate(),	
				(select idStatus      from tblStatus    where Objeto  = 'CLIQUE'   and Descricao = 'VALIDO')
		)


		
end




END