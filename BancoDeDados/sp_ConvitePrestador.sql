/*
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   
 Autor:   		Gilberto Anderson
 Create date:	05 abril 2022
 Description: 	Gera conteuto carta apresentacao
 Objetivo:  	
 Titulo:        sp_ConvitePrestador
 
 teste:         dbo.sp_ConvitePrestador 1
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
*/
/*
USE db_a49cbe_littleorange
GO
 
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[sp_ConvitePrestador]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[sp_ConvitePrestador;
GO


CREATE PROCEDURE [dbo].[sp_ConvitePrestador] 
(
   @idPrestador  int
)
AS
BEGIN
	SET NOCOUNT ON
*/
	declare @idPrestador  int
	set @idPrestador = 1
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

	set @ls_Atendente = ' Carol '
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
	set @ls_msg = @ls_msg + 'Bom dia ' + @ls_prestador + ', eu sou a ' + @ls_Atendente + ' do app The Little Orange. +char(13)+char(10)+'
	set @ls_msg = @ls_msg + 'Você prestou serviços de ' + @ls_especialidade + ' no ' + @ls_condominio + ' para ' + @ls_morador + '. +char(13)+char(10)+'
	set @ls_msg = @ls_msg + ' +char(13)+char(10)+'
	set @ls_msg = @ls_msg + 'O '+ @ls_morador + ' te cadastrou em nosso app para divulgar sua empresa, assim os outros moradores +char(13)+char(10)+'
	set @ls_msg = @ls_msg + ' poderão te encontrar mais facilmente e você poderá fazer novos negócios dentro do comdomínio ' + @ls_condominio + '.<br>'
	set @ls_msg = @ls_msg + '<br>'
	set @ls_msg = @ls_msg + 'Parabéns, é muito bom que você pode ser encontrado por todos moradores do ' + @ls_condominio + '.<br>'
	set @ls_msg = @ls_msg + '<br>'
	set @ls_msg = @ls_msg + 'Agora, imagine se você pudesse ser encontrado por todas as pessoas de ' + @ls_cidade
	set @ls_msg = @ls_msg + '?<br><br>'
	set @ls_msg = @ls_msg + 'Entre em contato agora e conheça os nossos planos.<br>'
	set @ls_msg = @ls_msg + 'Só pra você ter uma idéia, por um valor de R$ 26,00 mensais, toda a cidade ' + @ls_cidade +  ' vai ter acesso a você.<br><br>'
	set @ls_msg = @ls_msg + 'Se preferir, você pode me chamar aqui pelo whatsapp.<br><br><br><br>'
	set @ls_msg = @ls_msg + @ls_Atendente + '<br>'
	set @ls_msg = @ls_msg + '(11) 91114 1115 wa.me/5591114 1115<br>'
	set @ls_msg = @ls_msg + 'The Little Orange<br>'

	print  @ls_msg 

	 -- https://api.whatsapp.com/send?phone=seunumerodetelefone&text=sua%20mensagem
	
	
--END
--GO
