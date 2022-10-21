/*
  script Evolucao diaria
  Gilberto Anderson
  05/10/2022
  Verifica qtde de acoes por dia
*/


select COUNT(1) as Usuarios    from tblUsuario 
select COUNT(1) as Prestadores from tblPrestador
select COUNT(1) as Condominios from tblCondominio
select COUNT(1) as Avaliacao   from tblAvaliacao
select COUNT(1) as Assinaturas from tblAssinaturas
select COUNT(1) as Cliques     from tblCliques

select * from tblUsuario where dtCriacao >= '2022-09-22'
select * from tblPrestador
select * from tblCondominio
select * from tblAvaliacao
select * from tblAssinaturas
select * from tblCliques



select Nome from tblUsuario where dtCriacao >= '2022-09-22'


select  DISTINCT(CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23)) AS DIA, COUNT(1) QTDE from tblUsuario 
group by CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23)
order by CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23) desc

select  DISTINCT(CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23)) AS DIA, COUNT(1) QTDE from tblCondominio 
group by CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23)
order by CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23) desc

select  DISTINCT(CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23)) AS DIA, COUNT(1) QTDE from tblPrestador 
group by CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23)
order by CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23) desc

select  DISTINCT(CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23)) AS DIA, COUNT(1) QTDE from tblAssinaturas 
group by CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23)
order by CONVERT(VARCHAR, CONVERT(DATETIME,dtCriacao),23) desc

select  DISTINCT(CONVERT(VARCHAR, CONVERT(DATETIME,dtAvaliacao),23)) AS DIA, COUNT(1) QTDE from tblAvaliacao 
group by CONVERT(VARCHAR, CONVERT(DATETIME,dtAvaliacao),23)
order by CONVERT(VARCHAR, CONVERT(DATETIME,dtAvaliacao),23) desc

select  DISTINCT(CONVERT(VARCHAR, CONVERT(DATETIME,dtClique),23)) AS DIA, COUNT(1) QTDE from tblCliques 
group by CONVERT(VARCHAR, CONVERT(DATETIME,dtClique),23)
order by CONVERT(VARCHAR, CONVERT(DATETIME,dtClique),23) desc