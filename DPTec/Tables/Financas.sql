USE DPTec

GO

Create Table Financas
(
	cd_Financas Int Identity Not Null
		,Constraint PK_Fin_cd_Fincancas Primary Key (cd_Financas) 
	,tp_Conta Varchar(15) Not Null
	,cd_Banco Int Not Null
		,Constraint FK_Fin_cd_Banco Foreign Key (cd_Banco) References Banco (cd_Banco)
	,no_Agencia Numeric (16) Not Null
	,no_Conta Numeric (18) Not Null
	,no_Digito Int Null
	,cd_Status Int
		,Constraint FK_Fin_Status Foreign Key (cd_Status) References Status (cd_Status) 
	,cd_Matricula Int Not Null
		,Constraint FK_Fin_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula)
	,vl_Salario Decimal(10,2) Not Null
);