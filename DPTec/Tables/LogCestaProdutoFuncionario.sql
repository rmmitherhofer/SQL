USE DPTec

GO

Create Table LogCestaProdutoFuncionario
(
	cd_LogCestaProduto Int Unique Identity Not Null
	,cd_CestaProduto Int Not Null
	,cd_Produto Int Not Null
		,Constraint FK_LogCestProdFunc_Prod Foreign Key (cd_Produto) References Produto (cd_Produto) 	
	,cd_Matricula Int Not Null
		,Constraint FK_LogCestProdFunc_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula) 	
		,Constraint PK_LogCestProdFunc Primary Key (cd_LogCestaProduto)
	,dt_Inclusao SmalldateTime Not Null
	,ic_Ativo bit Not Null
	,ds_Log						VARCHAR(100)		NULL
	,tp_Operacao				CHAR(1)			NOT NULL	
	,dt_Cadastro				SmallDateTime		NULL
	,dt_Alteracao				SmallDateTime		NULL	
	,dt_Desativacao				SmallDateTime		NULL
	,cd_Usuario					Int				NOT NULL
		,Constraint FK_LogCestProdFunc_Usuario Foreign Key (cd_Usuario) References Usuario (cd_Usuario)
);