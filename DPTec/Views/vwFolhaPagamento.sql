USE DPtec

GO

Create View vwFolhaPagamento
as
select Distinct
pag.cd_Pagamento
,f.cd_Matricula
,f.nm_Funcionario
,c.ds_Cargo
,d.ds_Departamento
,convert(Varchar(20),DateAdd(mm, DateDiff(mm,1,Getdate()) +1,-1),105) as  dt_referencia
,case 
	when pag.cd_Pagamento is null then
		'Pendente de Fechamento'
	When pag.cd_Pagamento is not null then
		'Concluido'
End as Status_Pagamento
,s.ds_Status as ds_Status_func
,pag.dt_Pagamento
,ct.ds_Categoria
,pag.vl_TotalVencidos
,pag.vl_Descontos
,pag.vl_Liquidos
,p.cd_Status as cd_Status_Ponto
,p.dt_PeriodoFim
from funcionario f
left join Pagamento pag on month(dt_Pagamento) = month(getdate())
inner join Ponto p on p.cd_Matricula = f.cd_Matricula
inner join Cargo c on c.cd_Cargo = f.cd_Cargo
inner join Departamento d on d.cd_Departamento = f.cd_Departamento
inner join Status s on s.cd_Status = f.cd_Status
inner join Empresa e on e.cd_Empresa = f.cd_Empresa
left join Categoria ct on ct.cd_Categoria = pag.cd_Categoria
	


