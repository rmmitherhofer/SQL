USE DPtec

GO

Create View vwPonto
as 
Select Distinct
p.cd_ponto
,p.cd_Matricula
,f.nm_Funcionario
,c.ds_Cargo
,d.ds_Departamento
,p.ds_Mes
,convert(varchar(30),p.dt_PeriodoInicio,103) + ' a ' + convert(varchar(30),p.dt_PeriodoFim,103) as ds_Competencia
,p.cd_Status
,p.hr_Saldo_Referencia
,p.hr_Saldo
,s.ds_Status
,p.dt_PeriodoInicio
,p.dt_PeriodoFim
from Ponto p
inner join Funcionario f on f.cd_Matricula = p.cd_Matricula
inner join Cargo c on c.cd_Cargo = f.cd_Cargo
inner join Departamento d on d.cd_Departamento = f.cd_Departamento
inner join Status s on s.cd_Status = p.cd_Status
