USE DPtec

GO

Create View vwPagamento
as 
Select Distinct
	p.cd_Pagamento
	,p.cd_Empresa
	,e.nm_Razao_Social
	,e.no_CNPJ
	,p.cd_Matricula
	,f.nm_Funcionario
	,cg.ds_Cargo
	,d.cd_Departamento
	,d.ds_Departamento
	,d.cd_CCusto
	,fn.cd_Banco
	,b.nm_Banco
	,fn.no_Agencia
	,fn.no_Conta
	,fn.no_Digito
	,fn.vl_Salario
	,p.cd_Financas
	,c.ds_Categoria
	,p.dt_Referencia
	,convert(Varchar(20),DateAdd(mm, DateDiff(mm,1,p.dt_Referencia), 0),103) + ' a ' + convert(Varchar(20),DateAdd(mm, DateDiff(mm,1,p.dt_Referencia) +1,-1),103) as ds_Competencia
	,convert(Varchar(20),p.dt_Pagamento,103) as dt_Pagamento
	,p.vl_TotalVencidos
	,p.vl_Descontos
	,p.vl_Liquidos
from Pagamento p
	inner join Categoria c on c.cd_Categoria = p.cd_Categoria
	inner join Funcionario f on f.cd_Matricula = p.cd_Matricula
	inner join Financas fn on fn.cd_Matricula = f.cd_Matricula
	inner join Banco b on b.cd_Banco = fn.cd_Banco
	inner join Empresa e on e.cd_Empresa = f.cd_Empresa
	inner join Cargo cg on cg.cd_Cargo = f.cd_Cargo
	inner join Departamento d on d.cd_Departamento = f.cd_Departamento



