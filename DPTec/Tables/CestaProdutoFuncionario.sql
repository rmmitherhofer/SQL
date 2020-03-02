USE DPTec

GO

---- Gera uma Cesta de Beneficios que um Funcionario pode ter
Create Table CestaProdutoFuncionario
(
	cd_CestaProduto Int Unique Identity Not Null
	,cd_Produto Int Not Null
		,Constraint FK_CestProdFunc_Prod Foreign Key (cd_Produto) References Produto (cd_Produto) 	
	,cd_Matricula Int Not Null
		,Constraint FK_CestProdFunc_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula) 	
		,Constraint PK_CestProdFunc Primary Key (cd_Produto, cd_Matricula)
	,dt_Inclusao SmalldateTime Not Null
	,ic_Ativo bit Not Null
);
