/*
 TheLittleOrange
 Gilberto Anderson
 Cadastro de Especialidades


*/

select  * from tblEspecialidade

/*

update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''
update tblEspecialidade set icone = '' where descricao  = ''


*/



-- .................... petz
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('PETS','','Veterinario', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))

-- .................... limpeza



-- .................... construcao
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Constru��o','','Arquiteto', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Constru��o','','Design interiores', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Constru��o','','Empreiteiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Constru��o','','Engenheiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Constru��o','','Limpeza p�s obra', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Constru��o','','Marmoaria e Granito', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Constru��o','','Pedreiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Constru��o','','Azulejista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Constru��o','','Po�o artesiano', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Constru��o','','Remo��o entulho', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))

insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instala��o','','Antenista',              (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instala��o','','Automa��o residencial',  (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instala��o','','Instala��o eletr�nicos', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instala��o','','Instalador TV Digital',  (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instala��o','','Seguran�a Eletr�nica',   (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instala��o','','Toldos e Coberturas',    (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))

insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Encanador', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Eletricista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','G�s', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Gesso e Drywall', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Pavimenta��o', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Pintor', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Serralheria e Solda', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Vidraceiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))


insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Servi�os Gerais','','Chaveiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Servi�os Gerais','','Dedetizador', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Servi�os Gerais','','Desentupidor', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Servi�os Gerais','','Desinfe��o', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Servi�os Gerais','','Impermebilizador', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Servi�os Gerais','','Marceneiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Servi�os Gerais','','Marido de Aluguel', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Servi�os Gerais','','Mudan�as e Carretos', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Servi�os Gerais','','Tapeceiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))


insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Banheira', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Coifas e Exaustores', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Decorador', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Jardinagem', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Papel parede', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Paisagista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Montador m�veis', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Piscina', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Redes prote��o', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Personal Organizer', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Diarista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Faxineira', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Cozinheira', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))


-- .................... SAUDE
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Sa�de','fas fa-medkit','Acupuntura', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Sa�de','fas fa-medkit','Constelador', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Sa�de','fas fa-medkit','Dentista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Sa�de','fas fa-medkit','Fisioterapeuta', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Sa�de','fas fa-medkit','Geriatra', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Sa�de','fas fa-medkit','MicroFisio', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Sa�de','fas fa-medkit','Nutrologo', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Sa�de','fas fa-medkit','Ortopedista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Sa�de','fas fa-medkit','Pediatra', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))


-- .................... EDUCA��O
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Educa��o','','Ber�ario', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Educa��o','','Professor Yoga ', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Educa��o','','Professor Ioga ', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Educa��o','','Personal Trainer', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))


-- .................... VEICULOS
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Consultor Vendas VW', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Lava Rapido', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Mec�nico', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Troca �leo', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Acess�rios', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Acess�rios', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))

