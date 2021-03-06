USE [db_a49cbe_littleorange]
GO
/****** Object:  StoredProcedure [dbo].[sp_ConvitePrestadorWhatsapp]    Script Date: 05/04/2022 22:43:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   
 Autor:   		Gilberto Anderson
 Create date:	05 abril 2022
 Description: 	Gera conteuto carta apresentacao
 Objetivo:  	
 Titulo:        sp_ConvitePrestadorWhatsApp
 
 teste:         dbo.sp_ConvitePrestadorWhatsApp 2
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
*/

ALTER PROCEDURE [dbo].[sp_ConvitePrestadorWhatsapp] 
(
   @idPrestador  int
)
AS
BEGIN
	SET NOCOUNT ON

	---- Mensagem whatsapp quando o prestador for cadastrado
	declare @ls_msg varchar(max)
	declare @ls_usuario       varchar(60)
	declare @ls_especialidade varchar(60)
	declare @ls_condominio    varchar(60)
	declare @ls_morador       varchar(60)
	declare @ls_prestador     varchar(60)
	declare @ls_cidade        varchar(60)
	declare @ls_Atendente     varchar(60)
	declare @ls_celular       varchar(60)

	set @ls_Atendente = 'Carol '
	set @ls_celular = '5511911141115'

	select  @ls_Prestador = prest.Empresa ,
			@ls_morador   = usua.Nome,
		    @ls_especialidade = espec.Descricao,
			@ls_condominio= cond.Nome,
			@ls_morador = usua.Nome,
			@ls_celular= prest.Celular,
			@ls_cidade = cond.Cidade
	from tblPrestador					 prest
	INNER JOIN tblCondominio			 cond  on cond.idCondominio     = prest.idCondominio
	INNER JOIN tblUsuario				 usua  on usua.idUsuario        = prest.idCanal
	inner join tblPrestadorEspecialidade presp on presp.idPrestador     = prest.idPrestador
	inner join tblEspecialidade          espec on espec.idEspecialidade = presp.idEspecialidade
	where prest.idPrestador = @idPrestador

	--Mensagem whatsapp quando o prestador for cadastrado
	
	set @ls_celular = '5511911141115'
	set @ls_msg = '' 
	set @ls_msg = @ls_msg + 'https://api.whatsapp.com/send?phone=' + @ls_celular + ' &text='
	set @ls_msg = @ls_msg + 'Bom dia ' + @ls_prestador + ', eu sou a ' + @ls_Atendente + ' do app The Little Orange.\n ' 
	set @ls_msg = @ls_msg + 'Você prestou serviços de ' + @ls_especialidade + ' no ' + @ls_condominio + ' para ' + @ls_morador + '. '
	set @ls_msg = @ls_msg + '\n\n'
	set @ls_msg = @ls_msg + 'O '+ @ls_morador + ' te cadastrou em nosso app para divulgar sua empresa, assim os outros moradores\n'
	set @ls_msg = @ls_msg + 'poderão te encontrar mais facilmente e com isto você fará novos negócios dentro do comdomínio ' + @ls_condominio + '.\n'
	set @ls_msg = @ls_msg +  '\n'
	set @ls_msg = @ls_msg + 'Parabéns, é muito bom para você, ser encontrado por todos moradores do ' + @ls_condominio + '.\n\n'
	set @ls_msg = @ls_msg + 'Agora, imagine se você pudesse ser encontrado por todas as pessoas de ' + @ls_cidade
	set @ls_msg = @ls_msg + '?\n\n'
	set @ls_msg = @ls_msg + 'Entre em contato agora e conheça os nossos planos.\n'
	set @ls_msg = @ls_msg + 'Só pra você ter uma idéia, por um valor de R$ 26,00 mensais, toda a cidade ' + @ls_cidade +  ' vai ter acesso a você.\n\n'
	set @ls_msg = @ls_msg + 'Se preferir, você pode me chamar aqui pelo whatsapp.\n\n\n\n'
	set @ls_msg = @ls_msg +  '<a "https://api.whatsapp.com/send?phone=5511985281115&text=Falar com ' + @ls_morador + ' celular '+ @ls_celular +'">Entrar em contato</a>'

	set @ls_msg = @ls_msg + @ls_Atendente +  '\n'
	set @ls_msg = @ls_msg + '(11) 91114 1115\n'
	set @ls_msg = @ls_msg + 'The Little Orange\n\n'

	select  @ls_msg 

	 --https://api.whatsapp.com/send?phone=seunumerodetelefone&text=sua%20mensagem
	--https://velhobit.com.br/desenvolvimento/api-do-whatsapp-como-quebrar-linhas-e-passar-parametros-em-links.html
	
END
