
Declare @CodigoIBGE   varchar(7),
        @idCondominio int,
		@sql          varchar(max)
--- teste 1
set @CodigoIBGE = '3548708'
set @idCondominio = null


-- teste 2
set @CodigoIBGE = null
set @idCondominio = 2

set @sql = ''
set @sql = @sql + 'select condo.codigoIBGE ,condo.Nome,  prest.Empresa, espec.Descricao '
set @sql = @sql + 'from       tblCondominio             condo  '
set @sql = @sql + 'inner join tblPrestador              prest on prest.idCondominio    = condo.idCondominio '
set @sql = @sql + 'inner join tblPrestadorEspecialidade presp on presp.idPrestador     = prest.idPrestador '
set @sql = @sql + 'inner join tblEspecialidade          espec on espec.idEspecialidade = presp.idEspecialidade '

if @idCondominio is null begin
	set @sql = @sql + 'where condo.codigoIBGE   = ''' + @CodigoIBGE + ''''
end else begin
	set @sql = @sql + 'where condo.idCondominio = ' + convert(varchar,@idCondominio)
end
set @sql = @sql + ' group by condo.Nome, condo.codigoIBGE, prest.Empresa, espec.Descricao '

exec(@sql)



update tblPrestador set celular = '11911141115' where idprestador = 1



select * from tblStatus

select * from tblPrestador
select * from tblCondominio
select * from tblUsuario
select * from tblUsuarioCondominio


---- Mensagem whatsapp quando o prestador for cadastrado
declare @ls_msg varchar(max)
declare @ls_usuario       varchar(60)
declare @ls_especialidade varchar(60)
declare @ls_condominio    varchar(60)
declare @ls_morador       varchar(60)
declare @ls_prestador     varchar(60)

set @Atendente = ' Caroline '
select  @ls_Prestador = prest.Empresa ,
		@ls_morador   = usua.Nome,
       
from tblPrestador			prest
INNER JOIN tblCondominio	cond on cond.idCondominio = prest.idCondominio
INNER JOIN tblUsuario		usua on usua.idUsuario    = prest.idCanal
where prest.idPrestador = @idPrestador

--Mensagem whatsapp quando o prestador for cadastrado

set ls_msg = ls_msg + '' 
ls_msg = ls_msg + 'Bom dia ' + @ls_prestador + ', eu sou a ' + @Atendente + ' do app The Little Orange.<br>'
ls_msg = ls_msg + 'Você prestou serviços de ' + @ls_especialidade + ' no ' + @ls_condominio + ' para ' + @ls_morador + '.<br>'
ls_msg = ls_msg + '<br>'
ls_msg = ls_msg + 'O '+ @ls_morador + ' te cadastrou em nosso app para divulgar seus trabalho,assim os outros<br> '
ls_msg = ls_msg + 'moradores podem te encontrar mais facilmente e você poderá fazer novos negócios<br>.'
ls_msg = ls_msg + '<br>'
ls_msg = ls_msg + 'Parabéns, é muito bom que você possa ser encontrado por todos morados do ' + @Condominio + '.<br>'
ls_msg = ls_msg + '<br>'
ls_msg = ls_msg + 'Agora, imagine se você pudesse ser encontrado por todas as pessoas da vizinhança ou da '
ls_msg = ls_msg + ' sua cidade inteira ou ainda do estado?<br>'
ls_msg = ls_msg + '<br>'
ls_msg = ls_msg + 'Entre em contato conosco e conheça os nossos planos.<br>'
ls_msg = ls_msg + 'Só pra você ter uma idéia, por um valor de [R$ 25,00] mensais, toda a cidade vai ter acesso a você.<br>'
ls_msg = ls_msg + '<br>'
ls_msg = ls_msg + 'Você pode me chamar aqui pelo whatsapp.<br>'
ls_msg = ls_msg + '<br>'
ls_msg = ls_msg + '[Atendente]'




-- usuario x condominio

select * from tblPrestador
select * from tblStatus where objeto ='prestador'



delete from tblParcelas
delete from tblAssinaturas

update tblPrestador set idstatus = 34, celular= '11 982581115' where idPrestador  = 1
-- heber 11 957929260
-- rafa 11989151146
-- carol 11940010901
update tblPrestador set idstatus = 31, celular= '11 982581115' where idPrestador  = 1
update tblPrestador set idstatus = 34, celular= '11 957929260' where idPrestador  = 2
update tblPrestador set idstatus = 34, celular= '11989151146' where idPrestador  = 3
update tblPrestador set idstatus = 31, celular= '11 982581115' where idPrestador  = 4
update tblPrestador set idstatus = 31, celular= '11940010901' where idPrestador  = 23
update tblPrestador set idstatus = 31, celular= '11 982581115' where idPrestador  = 24

--update tblPrestador set idstatus = 14, celular= '11987875454' where idPrestador  = 23


update tblPrestador set idstatus = 31,Empresa = 'prof teste 01 ', celular= '11 982581115' where idPrestador  = 17
update tblPrestador set idstatus = 31,Empresa = 'prof teste 02 ', celular= '11 957929260' where idPrestador  = 18
update tblPrestador set idstatus = 31,Empresa = 'prof teste 03 ', celular= '11989151146' where idPrestador  = 19
update tblPrestador set idstatus = 31,Empresa = 'prof teste 04 ', celular= '11 957929260' where idPrestador  = 21
update tblPrestador set idstatus = 31,Empresa = 'prof teste 05 ', celular= '11989151146' where idPrestador  = 21
update tblPrestador set idstatus = 31,Empresa = 'prof teste 06 ', celular= '11 982581115' where idPrestador  = 22


select * from tblAssinaturas
select * from tblCondominio
select * from tblDominios
select * from tblUsuario
select * from tblUsuarioCondominio
select * from tblEspecialidade
select * from tblPrestadorEspecialidade

update tblDominios set descricao = 'CONTINENTE' where idDominio = 6

select usua.nome, usua.email, usua.senha, perf.descricao from tblUsuario usua
inner join tblUsuarioPerfil uspe on usua.idUsuario = uspe.idUsuario
inner join tblPerfil        perf on perf.idPerfil = uspe.idPerfil

select	pres.Empresa,
		stat.Descricao,
		pres.*
from tblPrestador    pres
inner join tblStatus stat on stat.idStatus = pres.idStatus



select * from tblDominios where objeto codigo > '01' 


select pres.Empresa,
		espe.*
from tblPrestador pres
inner join tblPrestadorEspecialidade prep on pres.idPrestador = prep.idPrestador
inner join tblEspecialidade          espe on espe.idEspecialidade = prep.idEspecialidade




select usua.*, cond.*
from       tblUsuarioCondominio usco
inner join tblUsuario           usua on usua.idUsuario = usco.idUsuario
inner join tblCondominio        cond on cond.idCondominio = usco.idCondominio


select cond.Nome as 'Condominiio',
       usua.Nome as 'Morador'
from       tblUsuarioCondominio usco
inner join tblUsuario           usua on usua.idUsuario = usco.idUsuario
inner join tblCondominio        cond on cond.idCondominio = usco.idCondominio
where usco.idStatus = 1


select * from tblCondominio


select condo.codigoIBGE ,
       espec.Descricao
from       tblCondominio             condo
inner join tblPrestador              prest on prest.idCondominio    = condo.idCondominio
inner join tblPrestadorEspecialidade presp on presp.idPrestador     = prest.idPrestador
inner join tblEspecialidade          espec on espec.idEspecialidade = presp.idEspecialidade
where condo.codigoIBGE = 3548708 -- codigo da cidade do condominio
group by condo.codigoIBGE ,   espec.Descricao


select condo.Nome ,
       espec.Descricao
from       tblCondominio             condo
inner join tblPrestador              prest on prest.idCondominio    = condo.idCondominio
inner join tblPrestadorEspecialidade presp on presp.idPrestador     = prest.idPrestador
inner join tblEspecialidade          espec on espec.idEspecialidade = presp.idEspecialidade
where condo.idCondominio = 2 -- Villa Verde 
group by condo.Nome ,   espec.Descricao





select * from tblCondominio
select * from tblPrestador
select * from tblEspecialidade
select * from tblPrestadorEspecialidade
select * from tblAvaliacao
select * from tblUsuario

  update tblUsuario
			set Celular = '11911141115',CPF_CNPJ= '54779016088' where idUsuario = 16


update tblPrestadorEspecialidade
set idEspecialidade = 1
where idPrestador  = 4

update tblPrestador
set idCondominio = 3
where idPrestador  = 2

select condo.codigoIBGE ,
       prest.*
from       tblCondominio             condo
inner join tblPrestador              prest on prest.idCondominio    = condo.idCondominio



Declare @CodigoIBGE   varchar(7),
        @idCondominio int,
		@sql          varchar(max)
--- teste 1
set @CodigoIBGE = '3548708'
set @idCondominio = null


-- teste 2
--set @CodigoIBGE = null
--set @idCondominio = 2

set @sql = ""
set @sql = @sql + 'select condo.codigoIBGE ,condo.Nome,  prest.Empresa, espec.Descricao '
set @sql = @sql + 'from       tblCondominio             condo'
set @sql = @sql + 'inner join tblPrestador              prest on prest.idCondominio    = condo.idCondominio'
set @sql = @sql + 'inner join tblPrestadorEspecialidade presp on presp.idPrestador     = prest.idPrestador'
set @sql = @sql + 'inner join tblEspecialidade          espec on espec.idEspecialidade = presp.idEspecialidade'

if @idCondominio is null then 
	set @sql = @sql + 'where case when   then condo.codigoIBGE   = ' + @CodigoIBGE 
else
	set @sql = @sql + 'where case when   then condo.idCondominio = ' + convert(varchar,@idCondominio)
end
set @sql = @sql + 'group by condo.Nome, condo.codigoIBGE ,prest.Empresa,   espec.Descricao'

exec @sql



-- .................................... criando a view
drop view view_EspecialidadeCondominioCidade

CREATE VIEW view_EspecialidadeCondominioCidade AS
select condo.idCondominio, condo.codigoIBGE , condo.Nome,  prest.Empresa, espec.Descricao, espec.Icone
from       tblCondominio             condo
inner join tblPrestador              prest on prest.idCondominio    = condo.idCondominio
inner join tblPrestadorEspecialidade presp on presp.idPrestador     = prest.idPrestador
inner join tblEspecialidade          espec on espec.idEspecialidade = presp.idEspecialidade
group by condo.idCondominio, condo.Nome, condo.codigoIBGE ,prest.Empresa,   espec.Descricao, espec.Icone


select * from view_EspecialidadeCondominioCidade
where idCondominio = 3

select * from view_EspecialidadeCondominioCidade
where codigoIBGE = '3548708'





-- .................................... criando a view
drop view view_TerceiroCondominioCidade

CREATE VIEW view_TerceiroCondominioCidade AS
select condo.idCondominio, condo.codigoIBGE , condo.Nome, prest.idPrestador,  prest.Empresa, prest.NotaAvaliacao , count(prest.QtdeAvaliacao) as 'Indicacoes', domin.Codigo as ' codAbrangencia', domin.Descricao as  'Abrangencia'
from       tblCondominio             condo
inner join tblPrestador              prest on prest.idCondominio    = condo.idCondominio
inner join tblDominios				 domin on prest.idAbrangencia   = domin.idDominio
group by condo.idCondominio, condo.Nome, condo.codigoIBGE, prest.idPrestador, prest.Empresa, prest.NotaAvaliacao, domin.Codigo, domin.Descricao

select * from view_TerceiroCondominioCidade


-- alter table tblEspecialidade add  [Icone] varchar(60)


update tblEspecialidade set Icone = 'bi bi-person-badge'
