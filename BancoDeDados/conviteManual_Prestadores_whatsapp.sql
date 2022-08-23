/*
 TheLittleOrange
 Gilberto Anderson
 Cadastro de Prestadores de Servico EM LOTE

*/

SET ANSI_PADDING OFF
drop table #tmpPrestadores

CREATE TABLE #tmpPrestadores(
	[idPrestador]		int identity(1,1) not null,
	[condominio]        varchar(240),
	[Empresa]			varchar(240), 
	[Email]				varchar(240),
	[Celular]			varchar(25) ,
	[Especialidade]		varchar(60),
	[Status]	        varchar(30)

)


-- estes aqui já estão completos
/*
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Odair José da Silva', '11 98669 8613','odairjose198128@gmail.com','Pedreiro','059.093.016.83 ')

*/

--insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Caroline Evelin', ' 11 940010901','','Diretora de Canais','novo')

-- insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Patricia Dornelles', '34 9175 4063','','Canais Minas Gerais','novo')
-- estes aqui já foram enviados
/*
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Andreia Medice', '11 99254 3381','','Arquiteto','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Erika', '11 97355 0028','','Arquiteto','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Pedro', '11 99964 6467','','Arquiteto','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Edson', '11 94883 5519','','Mecânico','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Dra Aline', '11 94586 8384','','Ortodentista','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Roberta', ' 11 91195 6635','','Pediatra','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Dra Jacque', '11 94146 7162','','Pediatra','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Assistência Técnica Cyrela', '11 94146 7162','','Assistência Técnica','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Vagner', ' 11 99948 7946','','Pedreiro','novo')
*/


 
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'HDI Seguros', '11 959153148','stecorretoradeseguros@hotmail.com','SEGURO','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Cia de Teatro Letra Jovem ', '11 981172969','cialetrajovem.teatro@gmail.com','Teatro','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Marcenária Maná', ' 11 973853417','','Marceneiro','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Miguel', ' 11 952752443','','Marceneiro','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Jujuba Biscoitos', ' 11 987965498','','Confeitaria','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'A Paulistana', ' 11 95854 1910','','Confeitaria','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Karina', ' 11 93053 5518','','Confeitaria','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Nalva', ' 11 94789 3213','','Confeitaria','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Wilson', ' 11 99515 3292','','Churrasqueiro','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Rodrigo', ' 11 94020 5857','','Churrasqueiro','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Dimas', ' 11 94010 7806','','Churrasqueiro','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Joabe Oliveira', ' 11 99748 6367','','Churrasqueiro','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Luiza Flach', ' 11 99287 0320','','Cacau Show','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Josefa', ' 11 98328 2598','','Passadeira','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Mania de Crepe', ' 11 94778 3537','','Fast Food','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Keila', ' 11 997411922','','Estética','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Miriam', ' 11 97460 6999','','Costureira','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Cleo', ' 11 98471 0607','','Diarista','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Piedade', ' 11 97191 4792','','Diarista','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Dilvanda', ' 11 97172 2534','','Diarista','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Shine', ' 11 98292 8052','','Lava Rapido','novo')
insert into #tmpPrestadores(condominio,Empresa,Celular,Email,Especialidade, Status) values('Auguri Residence | Living', 'Corso Arte', ' 11 99136 7103','','Molduras Quadros','novo')



select * from #tmpPrestadores


declare @condominio     varchar(240),
	@Empresa			varchar(240), 
	@Email				varchar(240),
	@Celular			varchar(25) ,
	@Especialidade		varchar(60),
	@Status             varchar(30),
	@idPrestador		int,
	@idEspecialidade	int,
	@sql varchar(max)


select @condominio =  condominio, @Empresa = Empresa, @Celular = Celular, @Especialidade = Especialidade,  @Email = Email 
from #tmpPrestadores
where idPrestador = 12


print  ' '
print  'https://api.whatsapp.com/send?phone=55' + Replace(@Celular, ' ','') + '&text=Olá ' + @Empresa + ','
print  ' '
print  ' '


print  'você foi indicado como prestador de serviços no grupo de whatsapp do condominio ' + @condominio + '. ' 
print  ' '
print  'Criamos uma plataforma onde os moradores podem pesquisar por prestadores de serviços indicados por outros moradores, ele se chama The Little Orange!'
print  ' '
print  'Como você foi indicado no grupo, gostariamos de saber se você quer ser cadastrado gratuitamente no nosso aplicativo, '
print  'desta forma você poderá ser encontrado por todos os moradores deste condomínio sem custo algum.'
print  ' '
print  'Preencha os dados que faltam, ou altere a informação que está errada e faremos seu cadastro.'
print  'Em breve você receberá um e-mail e poderá acesssar o nosso aplicativo' 
print  '- - - - - - - - - - - - - - - - -' 
print  'P R E S T A D O R' 
print  '- - - - - - - - - - - - - - - - -' 
print  'Condominio: ' + @condominio 
print  'Empresa: ' + @Empresa	   
print	'Especialidade: ' + @Especialidade 
print	'Celular: ' + @Celular 
print	'Email: ' + @Email  
print	'CPF/CNPJ: ' 
print  ' '
print  'https://thelittleorange.app'



