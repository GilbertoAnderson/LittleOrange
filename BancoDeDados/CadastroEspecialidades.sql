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
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Construção','','Arquiteto', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Construção','','Design interiores', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Construção','','Empreiteiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Construção','','Engenheiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Construção','','Limpeza pós obra', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Construção','','Marmoaria e Granito', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Construção','','Pedreiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Construção','','Azulejista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Construção','','Poço artesiano', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Construção','','Remoção entulho', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))

insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instalação','','Antenista',              (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instalação','','Automação residencial',  (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instalação','','Instalação eletrônicos', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instalação','','Instalador TV Digital',  (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instalação','','Segurança Eletrônica',   (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Instalação','','Toldos e Coberturas',    (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))

insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Encanador', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Eletricista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Gás', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Gesso e Drywall', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Pavimentação', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Pintor', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Serralheria e Solda', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Reforma Reparos','','Vidraceiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))


insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Serviços Gerais','','Chaveiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Serviços Gerais','','Dedetizador', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Serviços Gerais','','Desentupidor', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Serviços Gerais','','Desinfeção', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Serviços Gerais','','Impermebilizador', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Serviços Gerais','','Marceneiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Serviços Gerais','','Marido de Aluguel', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Serviços Gerais','','Mudanças e Carretos', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Serviços Gerais','','Tapeceiro', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))


insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Banheira', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Coifas e Exaustores', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Decorador', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Jardinagem', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Papel parede', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Paisagista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Montador móveis', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Piscina', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Redes proteção', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Personal Organizer', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Diarista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Faxineira', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Para Casa','fas fa-house-user','Cozinheira', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))


-- .................... SAUDE
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Saúde','fas fa-medkit','Acupuntura', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Saúde','fas fa-medkit','Constelador', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Saúde','fas fa-medkit','Dentista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Saúde','fas fa-medkit','Fisioterapeuta', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Saúde','fas fa-medkit','Geriatra', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Saúde','fas fa-medkit','MicroFisio', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Saúde','fas fa-medkit','Nutrologo', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Saúde','fas fa-medkit','Ortopedista', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Saúde','fas fa-medkit','Pediatra', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))


-- .................... EDUCAÇÃO
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Educação','','Berçario', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Educação','','Professor Yoga ', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Educação','','Professor Ioga ', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Educação','','Personal Trainer', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))


-- .................... VEICULOS
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Consultor Vendas VW', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Lava Rapido', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Mecânico', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Troca Óleo', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Acessórios', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))
insert into tblEspecialidade(Area, Icone, Descricao, idStatus) values('Veiculos','fas fa-car','Acessórios', (select idStatus from tblStatus where Objeto = 'ESPECIALIDADE' and Descricao = 'ATIVO'))

