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
-- .................................................................... 04 tblUsuarios
-- .................................................................... 05 tblCondominios
-- .................................................................... 06 tblUsuarioCondominio
-- .................................................................... 07 tblUsuarioPerfil
-- .................................................................... 08 tblEspecialidade
-- .................................................................... 09 tblPrestador
-- .................................................................... 10 tblPrestadorEspecialidade
-- .................................................................... 11 tblAvaliacao
-- .................................................................... 12 tblAssinaturas
-- .................................................................... 13 tblCliques
-- .................................................................... 14 tblParcelas
-- .................................................................... 15 tblContas
-- .................................................................... 16 tblLancamentos


*/

BEGIN-- .......................... apagando todas as tabelas


-- .................................................................... 16 tblLancamentos
	if Exists(Select name from sysobjects where name='tblLancamentos')Begin 
		drop table dbo.tblLancamentos
	End

-- .................................................................... 15 tblContas
	if Exists(Select name from sysobjects where name='tblContas')Begin 
		drop table dbo.tblContas
	End

-- .................................................................... 14 tblParcelas
	if Exists(Select name from sysobjects where name='tblParcelas')Begin 
		drop table dbo.tblParcelas
	End

-- .................................................................... 13 tblCliques
	if Exists(Select name from sysobjects where name='tblCliques')Begin 
		drop table dbo.tblCliques
	End

-- .................................................................... 12 tblAssinaturas
	if Exists(Select name from sysobjects where name='tblAssinaturas')Begin 
		drop table dbo.tblAssinaturas
	End
-- .................................................................... 11 tblAvaliacao
	if Exists(Select name from sysobjects where name='tblAvaliacao')Begin 
		drop table dbo.tblAvaliacao
	End

-- .................................................................... 10 tblPrestadorEspecialidade
	if Exists(Select name from sysobjects where name='tblPrestadorEspecialidade')Begin 
		drop table dbo.tblPrestadorEspecialidade
	End
	
-- .................................................................... 09 tblPrestador
	if Exists(Select name from sysobjects where name='tblPrestador')Begin 
		drop table dbo.tblPrestador
	End
	
-- .................................................................... 08 tblEspecialidade
	if Exists(Select name from sysobjects where name='tblEspecialidade')Begin 
		drop table dbo.tblEspecialidade
	End
	
-- .................................................................... 07 tblUsuarioPerfil
	if Exists(Select name from sysobjects where name='tblUsuarioPerfil')Begin 
		drop table dbo.tblUsuarioPerfil
	End
	
-- .................................................................... 06 tblUsuarioCondominio
	if Exists(Select name from sysobjects where name='tblUsuarioCondominio')Begin 
		drop table dbo.tblUsuarioCondominio
	End

	
-- .................................................................... 05 tblCondominios
	if Exists(Select name from sysobjects where name='tblCondominio')Begin 
		drop table dbo.tblCondominio
	End
	
-- .................................................................... 04 tblUsuarios
	if Exists(Select name from sysobjects where name='tblUsuario')Begin 
		drop table dbo.tblUsuario
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
	
-- .................................................................... 06 tblUsuarioCondominio
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('USUARIO_CONDOMINIO','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('USUARIO_CONDOMINIO','INATIVO', GETDATE(), 1)


-- .................................................................... 07 tblUsuarioPerfil
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('USUARIO_PERFIL','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('USUARIO_PERFIL','INATIVO', GETDATE(), 1)
	
-- .................................................................... 08 tblEspecialidade
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('ESPECIALIDADE','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('ESPECIALIDADE','INATIVO', GETDATE(), 1)

-- .................................................................... 09 tblPrestador
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR','Trafego', GETDATE(), 1)	
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR','Prospectado', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR','Oportunidade', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR','Negociando', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR','Pagamento', GETDATE(), 1)

	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR','INATIVO', GETDATE(), 1)
	
-- .................................................................... 10 tblPrestadorEspecialidade
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR_ESPECIALIDADE','ATIVO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PRESTADOR_ESPECIALIDADE','INATIVO', GETDATE(), 1)

-- .................................................................... 11 tblAvaliacao
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('AVALIACAO','APROVADA', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('AVALIACAO','EM ANALISE', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('AVALIACAO','CONTESTADA', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('AVALIACAO','REPROVADA', GETDATE(), 1)

-- .................................................................... 12 tblAssinaturas
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

-- .................................................................... 13 tblClique
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('CLIQUE','VALIDO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('CLIQUE','INVALIDO', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('CLIQUE','EM ANALISE', GETDATE(), 1)
	
-- .................................................................... 14 tblParcelas
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PARCELA','ABERTA', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PARCELA','PAGA', GETDATE(), 1)
	INSERT INTO tblStatus(Objeto,Descricao,DtCriacao,idAlteracao)
	VALUES('PARCELA','CANCELADA', GETDATE(), 1)

end


-- .................................................................... 02 tblPerfil
begin		
	if Exists(Select name from sysobjects where name='tblPerfil')Begin 
		drop table dbo.tblPerfil
	End
	
	create table dbo.tblPerfil(
		[idPerfil]		int identity(1,1) not null,
		[Descricao]		varchar(020)      not null,
		[idStatus]		int               not null,
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
	VALUES('ABRANGENCIA','04','REGIAO')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ABRANGENCIA','05','PAIS')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ABRANGENCIA','06','CONTINENTAL')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ABRANGENCIA','07','MUNDIAL')

	
	delete from tblDominios where Objeto = 'VALORPLANO'
	delete from tblDominios where Objeto = 'DESCONTO'

	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('VALORPLANO','01','0.00')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('VALORPLANO','02','26.00')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('VALORPLANO','03','35.00')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('VALORPLANO','04','53.00')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('VALORPLANO','05','143.00')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('VALORPLANO','06','260.00')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('VALORPLANO','07','350.00')

	
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('DESCONTO','00','00.00')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('DESCONTO','M1','00.00')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('DESCONTO','A1','10.00')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('DESCONTO','A3','20.00')

	
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('PRAZOPLANO','M1','1')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('PRAZOPLANO','A1','12')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('PRAZOPLANO','A3','36')

	
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ORIGEM','OT','TELEFONE')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ORIGEM','OW','WHATSAPP')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('ORIGEM','OM','MAPA')

	
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('PLANO','00','NOVO')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('PLANO','M1','MENSAL')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('PLANO','A1','1 ANO')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('PLANO','A3','3 ANOS')
	
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('FORMAPAGTO','00','NOVO')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('FORMAPAGTO','01','BOLETO')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('FORMAPAGTO','02','CREDITO')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('FORMAPAGTO','03','DEBITO EM CONTA')
	INSERT INTO tblDominios(Objeto,Codigo,Descricao)
	VALUES('FORMAPAGTO','04','PIX')
	
	
end


-- .................................................................... 04 tblUsuarios
begin	 
 
	
	if Exists(Select name from sysobjects where name='tblUsuario')Begin 
		drop table dbo.tblUsuario
	End
	
	create table dbo.tblUsuario(
		[idUsuario]			int identity(1,1) not null,
		[Nome]				varchar(240)      not null,
		[Email]				varchar(240)      not null,
		[Senha]				varchar(020)      not null,
		[Celular]			varchar(025)      not null,
		[dtNascimento]		datetime,
		[CPF_CNPJ]		    varchar(014),
		[idStatus]			int              not null,
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
	

		--CREATE UNIQUE INDEX idx_Usuario
		--ON tblUsuario ([Nome], [Email]);

		CREATE UNIQUE INDEX idx_UsuarioEmail
		ON tblUsuario ([Email]);

		
		CREATE UNIQUE INDEX idx_UsuarioCPF
		ON tblUsuario ([CPF_CNPJ]);
				
		ALTER TABLE dbo.tblUsuario
		ADD CONSTRAINT fk_tblUsuarioStatus
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)
		
		select * from  tblUsuario
		


		insert into tblUsuario(Email,  Nome, Senha, Celular, [CPF_CNPJ], idStatus)
		values('gilberto.anderson@gmail.com', 'Gilberto Anderson','segredo','1198988989','04305254867',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		

		insert into tblUsuario(Email,  Nome, Senha, Celular, [CPF_CNPJ], idStatus)
		values('cacau17.cs@gmail.com', 'Caroline Santos','segredo','1191114115','54779016088',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		
		-- cadastro de morados, 1 para cada condominio
		insert into tblUsuario(Email, Nome, Senha, Celular, [CPF_CNPJ], idStatus)
		values('morador01@teste.com', 'Morador 01 Teste','segredo','11 9898 8989','79646434878',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		
		
		insert into tblUsuario(Email, Nome, Senha, Celular, [CPF_CNPJ], idStatus)
		values('morador02@teste.com', 'Morador 02 Teste','segredo','11 9898 8989','44413090233',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		
		
		insert into tblUsuario(Email, Nome, Senha, Celular,[CPF_CNPJ], idStatus)
		values('morador03@teste.com', 'Morador 03 Teste','segredo','11 9898 8989','03724984227',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		
		
		-- cadastro do canal do condominio 01
		insert into tblUsuario(Email,  Nome, Senha, Celular,[CPF_CNPJ],  idStatus)
		values('canal01@teste.com',  'Canal 01 Teste','segredo', '11 9898 8989','07471554029', 
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		

		-- cadastro do canal do condominio 02
		insert into tblUsuario(Email,  Nome, Senha, Celular,[CPF_CNPJ],  idStatus)
		values('canal02@teste.com',  'Canal 02 Teste','segredo', '11 9898 8989','14211291912', 
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		

		-- cadastro do prestador condominio 01
		insert into tblUsuario(Email, Nome, Senha, Celular,[CPF_CNPJ],  idStatus)
		values('prestador01@teste.com', 'Prestador 01 Teste','segredo', '44021910174','1198988989',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		
		
		-- cadastro do prestador condominio 02
		insert into tblUsuario(Email, Nome, Senha, Celular, [CPF_CNPJ],  idStatus)
		values('prestador02@teste.com', 'Prestador 02 Teste','segredo','1198988989','84237391558',
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		

		-- cadastro do prestador condominio 03
		insert into tblUsuario(Email, Nome, Senha, Celular,[CPF_CNPJ],  idStatus)
		values('prestador03@teste.com', 'Prestador 03 Teste','segredo','1198988989','89645651859' , 
				(select idStatus from tblStatus where Objeto = 'USUARIO' and Descricao = 'ATIVO'))
		  
end


-- .................................................................... 05 tblCondominios
begin	
	
		if Exists(Select name from sysobjects where name='tblCondominio')Begin 
			drop table dbo.tblCondominio
		End
		
		create table dbo.tblCondominio(
		[idCondominio]	int identity(1,1) not null,
		[Nome]			varchar(240),
		[Endereco]		varchar(240),
		[Numero]	    int,
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
		[idUsuario]		int            not null,  ----- 
		[idStatus]		int            not null,
		
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

		ALTER TABLE dbo.tblCondominio
		ADD CONSTRAINT fk_tblCondominio_Usuario
		FOREIGN KEY (idUsuario)
		REFERENCES tblUsuario(idUsuario)

		CREATE INDEX idx_Condominio
		ON tblCondominio ([Nome]);

		/*
		  ao cadastrar um condominio o app deve pegar o cep e localizar atraves de APIs
		  o endereco, tambem deve gravar latitude , longitude e o codigo ibge da cidade
		
		
		*/
		
		-- condominio 01
		insert into tblCondominio([Nome], [Endereco], [Complemento], [Bairro], [Cidade], [UF], [Pais], [CEP], [Fone], [CodigoIBGE], [Latitude], [Longitude], [idUsuario],[idStatus]) 
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
				1,
				(select idStatus from tblStatus where Objeto = 'CONDOMINIO' and Descricao = 'ATIVO'))


		insert into tblCondominio([Nome], [Endereco], [Complemento], [Bairro], [Cidade], [UF], [Pais], [CEP], [Fone], [CodigoIBGE], [Latitude], [Longitude], [idUsuario],  [idStatus]) 
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
				1,
				(select idStatus from tblStatus where Objeto = 'CONDOMINIO' and Descricao = 'ATIVO'))
		
		insert into tblCondominio([Nome], [Endereco], [Complemento], [Bairro], [Cidade], [UF], [Pais], [CEP], [Fone], [CodigoIBGE], [Latitude], [Longitude],[idUsuario], [idStatus]) 
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
				1,
				(select idStatus from tblStatus where Objeto = 'CONDOMINIO' and Descricao = 'ATIVO'))
		
	
		insert into tblCondominio([Nome], [Endereco], [Complemento], [Bairro], [Cidade], [UF], [Pais], [CEP], [Fone], [CodigoIBGE], [Latitude], [Longitude],[idUsuario], [idStatus]) 
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
				1,
				(select idStatus from tblStatus where Objeto = 'CONDOMINIO' and Descricao = 'ATIVO'))
		
	
end


-- .................................................................... 06 tblUsuarioCondominio
begin	 
	
		if Exists(Select name from sysobjects where name='tblUsuarioCondominio')Begin 
			drop table dbo.tblUsuarioCondominio
		End
		
		create table dbo.tblUsuarioCondominio(
		[idUsuario]		int not null,
		[idCondominio]	int not null,
		[idStatus]		int not null,	
		
		CONSTRAINT [PK_tblUsuarioCondominio] PRIMARY KEY CLUSTERED 
		(
			[idUsuario],[idCondominio]   ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]
		
		
		ALTER TABLE dbo.tblUsuarioCondominio
		ADD CONSTRAINT fk_tblUsuarioCondominio_Condominio
		FOREIGN KEY ([idCondominio])
		REFERENCES tblCondominio([idCondominio])
		
		ALTER TABLE dbo.tblUsuarioCondominio
		ADD CONSTRAINT fk_tblUsuarioCondominio_Usuario
		FOREIGN KEY (idUsuario)
		REFERENCES tblUsuario(idUsuario)

		ALTER TABLE dbo.tblUsuarioCondominio
		ADD CONSTRAINT fk_tblUsuarioCondominio_Status
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)


		
		-- cadastro usuario condominio
		insert into tblUsuarioCondominio(idUsuario, idCondominio, [idStatus]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Gilberto Anderson'),
				(select idCondominio from tblCondominio where Nome = 'Helbor Family Garden'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_CONDOMINIO' and Descricao = 'ATIVO'))

		insert into tblUsuarioCondominio(idUsuario, idCondominio, [idStatus]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Gilberto Anderson'),
				(select idCondominio from tblCondominio where Nome = 'Condomínio Villa Verde'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_CONDOMINIO' and Descricao = 'ATIVO'))

		insert into tblUsuarioCondominio(idUsuario, idCondominio, [idStatus]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Gilberto Anderson'),
				(select idCondominio from tblCondominio where Nome = 'Auguri Residence | Living'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_CONDOMINIO' and Descricao = 'ATIVO'))


		
end


-- .................................................................... 07 tblUsuarioPerfil
begin	 
	
		if Exists(Select name from sysobjects where name='tblUsuarioPerfil')Begin 
			drop table dbo.tblUsuarioPerfil
		End
		
		create table dbo.tblUsuarioPerfil(
		[idUsuario]		int not null,
		[idPerfil]		int not null,
		[idStatus]		int not null,
		[dtValidade]	datetime,
		
		CONSTRAINT [PK_tblUsuarioPerfil] PRIMARY KEY CLUSTERED 
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

		insert into tblUsuarioPerfil(idUsuario, idPerfil, [idStatus], [dtValidade]) 
		values(		
				(select idUsuario from tblUsuario where Nome      = 'Caroline Santos'),
				(select idPerfil  from tblPerfil  where Descricao = 'CANAL'),
				(select idStatus  from tblStatus  where Objeto    = 'USUARIO_PERFIL' and Descricao = 'ATIVO'),
				dateadd(month,30,GETDATE()))	

				

end


-- .................................................................... 08 tblEspecialidade
begin

	
		
		if Exists(Select name from sysobjects where name='tblEspecialidade')Begin 
			drop table dbo.tblEspecialidade
		End
		
		create table dbo.tblEspecialidade(
		[idEspecialidade]	int identity(1,1) not null,
		[Area]				varchar(30),
		[Descricao]			varchar(60),
		[Icone]				varchar(60),
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
			
			
		
end


-- .................................................................... 09 tblPrestador
begin 
	
	if Exists(Select name from sysobjects where name='tblPrestador')Begin 
		drop table dbo.tblPrestador
	End
	
	create table dbo.tblPrestador(
		[idPrestador]		int identity(1,1) not null,
		[idCondominio]		int not null,
		[idCanal]			int not null,
		[idAbrangencia]		int not null,
		[idPlano]			int not null,
		[idFormaPagto]		int not null,
		[Empresa]			varchar(240)      not null,
		[Endereco]			varchar(240),
		[Numero]			int,
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
		[idStatus]			int             not null,
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

		ALTER TABLE dbo.tblPrestador
		ADD CONSTRAINT fk_tblPrestadorPlano
		FOREIGN KEY ([idPlano])
		REFERENCES tblDominios(idDominio)

		ALTER TABLE dbo.tblPrestador
		ADD CONSTRAINT fk_tblPrestadorFormaPagto
		FOREIGN KEY ([idFormaPagto])
		REFERENCES tblDominios(idDominio)
	
	    /*

		  ao cadastrar um prestador o app deve pegar o cep e localizar atraves de APIs
		  o endereco, tambem deve gravar latitude , longitude e o codigo ibge da cidade
		
		*/




		insert into tblPrestador([idCondominio],  [idAbrangencia], [idPlano], [idFormaPagto], [Empresa], [idCanal],  [Endereco],[Complemento],
									[Bairro], [Cidade],[UF], [Pais], [CEP], [Fone], [Celular],[cpf_cnpj], [CodigoIBGE], Latitude,
									Longitude,[Email],[idStatus])
		values(  1, 
				(select idDominio from tblDominios where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
				(select idDominio from tblDominios where Objeto = 'PLANO' and Descricao = 'NOVO'),
				(select idDominio from tblDominios where Objeto = 'FORMAPAGTO' and Descricao = 'NOVO'),
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
				(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'NOVO'))
		
		
		insert into tblPrestador([idCondominio],  [idAbrangencia], [idPlano], [idFormaPagto], [Empresa], [idCanal],  [Endereco],[Complemento],
									[Bairro], [Cidade],[UF], [Pais], [CEP], [Fone], [Celular],[cpf_cnpj], [CodigoIBGE], Latitude,
									Longitude,[Email],[idStatus])
				values(  1, 
				(select idDominio from tblDominios where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
				(select idDominio from tblDominios where Objeto = 'PLANO' and Descricao = 'NOVO'),
				(select idDominio from tblDominios where Objeto = 'FORMAPAGTO' and Descricao = 'NOVO'),
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
				(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'NOVO'))
		

		
		insert into tblPrestador([idCondominio],  [idAbrangencia], [idPlano], [idFormaPagto], [Empresa], [idCanal],  [Endereco],[Complemento],
									[Bairro], [Cidade],[UF], [Pais], [CEP], [Fone], [Celular],[cpf_cnpj], [CodigoIBGE], Latitude,
									Longitude,[Email],[idStatus])
				values(  1, 
				(select idDominio from tblDominios where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
				(select idDominio from tblDominios where Objeto = 'PLANO' and Descricao = 'NOVO'),
				(select idDominio from tblDominios where Objeto = 'FORMAPAGTO' and Descricao = 'NOVO'),
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
				(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'NOVO'))
		
		
		insert into tblPrestador([idCondominio],  [idAbrangencia], [idPlano], [idFormaPagto], [Empresa], [idCanal],  [Endereco],[Complemento],
									[Bairro], [Cidade],[UF], [Pais], [CEP], [Fone], [Celular],[cpf_cnpj], [CodigoIBGE], Latitude,
									Longitude,[Email],[idStatus])
				values(  1, 
				(select idDominio from tblDominios where Objeto = 'ABRANGENCIA' and Descricao = 'CONDOMINIO'),
				(select idDominio from tblDominios where Objeto = 'PLANO' and Descricao = 'NOVO'),
				(select idDominio from tblDominios where Objeto = 'FORMAPAGTO' and Descricao = 'NOVO'),
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
				(select idStatus   from tblStatus where Objeto = 'PRESTADOR' and Descricao = 'NOVO'))
		

end


-- .................................................................... 10 tblPrestadorEspecialidade
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


-- .................................................................... 11 tblAvaliacao
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
			[idAvaliacao]  ASC
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



-- .................................................................... 12 tblCliques
begin 

		if Exists(Select name from sysobjects where name='tblCliques')Begin 
			drop table dbo.tblCliques
		End
		
		create table dbo.tblCliques(
		[idClique]			int identity(1,1) not null,
		[idPrestador]		int not null,
		[idMorador]			int not null,
		[idOrigem]		    int not null,
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

		
		ALTER TABLE dbo.tblCliques
		ADD CONSTRAINT fk_tblCliques_Origem
		FOREIGN KEY ([idOrigem])
		REFERENCES tblDominios([idDominio])
				
				


		insert into tblCliques([idPrestador],[idMorador], [idOrigem], [dtClique], [idStatus])		
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Canal 01 Teste' ),
				(select idDominio     from tblDominios  where Objeto  = 'ORIGEM' and Descricao = 'TELEFONE'),
				getdate(),	
				(select idStatus      from tblStatus    where Objeto  = 'CLIQUE'   and Descricao = 'VALIDO')
		)

		
		insert into tblCliques([idPrestador],[idMorador], [idOrigem], [dtClique], [idStatus])	
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Canal 01 Teste' ),
				(select idDominio     from tblDominios  where Objeto  = 'ORIGEM' and Descricao = 'TELEFONE'),
				getdate(),	
				(select idStatus      from tblStatus    where Objeto  = 'CLIQUE'   and Descricao = 'EM ANALISE')
		)

		
		insert into tblCliques([idPrestador],[idMorador], [idOrigem], [dtClique], [idStatus])	
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Canal 01 Teste' ),
				(select idDominio     from tblDominios  where Objeto  = 'ORIGEM' and Descricao = 'WHATSAPP'),
				getdate(),	
				(select idStatus      from tblStatus    where Objeto  = 'CLIQUE'   and Descricao = 'INVALIDO')
		)
		
		insert into tblCliques([idPrestador],[idMorador], [idOrigem], [dtClique], [idStatus])		
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Morador 01 Teste' ),
				(select idDominio     from tblDominios  where Objeto  = 'ORIGEM' and Descricao = 'MAPA'),
				getdate(),	
				(select idStatus      from tblStatus    where Objeto  = 'CLIQUE'   and Descricao = 'VALIDO')
		)

		
		insert into tblCliques([idPrestador],[idMorador], [idOrigem], [dtClique], [idStatus])		
		values(
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),				
				(select idUsuario     from tblUsuario   where Nome    = 'Morador 02 Teste' ),
				(select idDominio     from tblDominios  where Objeto  = 'ORIGEM' and Descricao = 'WHATSAPP'),
				getdate(),	
				(select idStatus      from tblStatus    where Objeto  = 'CLIQUE'   and Descricao = 'VALIDO')
		)

end


-- .................................................................... 13 tblAssinaturas
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
		[Rastreador]		varchar(16),
		[dtInicio]			datetime,
		[dtTermino]			datetime,
		[ValorContrato]		decimal(18,2),
		[DiaPagamento]		int,
		[Log]				varchar(max),
		
		CONSTRAINT [PK_tblAssinaturas] PRIMARY KEY CLUSTERED 
		(
			[idAssinatura] ASC
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


-- .................................................................... 13 tblParcelas
	begin 

		if Exists(Select name from sysobjects where name='tblParcelas')Begin 
			drop table dbo.tblParcelas
		End
		
		create table dbo.tblParcelas(
		[idParcela]			int identity(1,1) not null,
		[idAssinatura]		int not null,
		[idPrestador]		int not null,
		[Rastreador]		varchar(16),
		[dataVencimento]	datetime not null,
		[dataPagamento]		datetime,
		[valorDevido]		decimal(18,2),
		[valorPago]			decimal(18,2),
		[Log]				varchar(max),
		[idStatus]			int not null,
		
		CONSTRAINT [PK_tblParcelas] PRIMARY KEY CLUSTERED 
		(
			[idParcela] ASC
		)WITH (
				PAD_INDEX  = OFF, 
				STATISTICS_NORECOMPUTE  = OFF, 
				IGNORE_DUP_KEY = OFF,	
				ALLOW_ROW_LOCKS  = ON, 
				ALLOW_PAGE_LOCKS  = ON) 
				ON [PRIMARY]
		) ON [PRIMARY]


		ALTER TABLE dbo.tblParcelas
		ADD CONSTRAINT fk_tblParcelas_Status
		FOREIGN KEY (idStatus)
		REFERENCES tblStatus(idStatus)

		
		ALTER TABLE dbo.tblParcelas
		ADD CONSTRAINT fk_tblParcelas_Assinatura
		FOREIGN KEY (idAssinatura)
		REFERENCES tblAssinaturas(idAssinatura)
		
		ALTER TABLE dbo.tblParcelas
		ADD CONSTRAINT fk_tblParcelas_Prestador
		FOREIGN KEY (idPrestador)
		REFERENCES tblPrestador(idPrestador)


		insert into tblParcelas( [idAssinatura],[idPrestador],[dataVencimento], [valorDevido],[idStatus]) values(
		        (select idAssinatura   from tblAssinaturas where idPrestador = (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas')),
		        (select idPrestador   from tblPrestador where Empresa = 'Hospital Veterinário Quatro Patas'),
				GETDATE(),
				26.00,
				(select idStatus      from tblStatus    where Objeto  = 'PARCELA'   and Descricao = 'ABERTA')
		)

	end


-- .................................................................... 15 tblContas
	begin 

		if Exists(Select name from sysobjects where name='tblCliques')Begin 
			drop table dbo.tblCliques
		End
		
		create table dbo.tblCliques(
		[idClique]			int identity(1,1) not null,
		[idPrestador]		int not null,
		[idMorador]			int not null,
		[idOrigem]		    int not null,
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

	end


-- .................................................................... 16 tblLancamentos
	begin 

		if Exists(Select name from sysobjects where name='tblCliques')Begin 
			drop table dbo.tblCliques
		End
		
		create table dbo.tblCliques(
		[idClique]			int identity(1,1) not null,
		[idPrestador]		int not null,
		[idMorador]			int not null,
		[idOrigem]		    int not null,
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

	end



END


/*

ALTER TABLE tblPrestador ALTER column [idFormaPagto]		int null
ALTER TABLE tblPrestador ALTER column [idPlano]		        int null
		
UPDATE tblPrestador SET idPlano =(select idDominio from tblDominios where Objeto = 'PLANO' and Descricao = 'NOVO')
				
UPDATE tblPrestador SET idFormaPagto =(select idDominio from tblDominios where Objeto = 'FORMAPAGTO' and Descricao = 'NOVO')




*/