USE DPTec

GO


Create Table LogCestaProdutoDependente
(
	cd_LogCestaProdutoDependente Int Unique Identity Not Null	
	,cd_CestaBeneficio Int		
	,cd_Produto Int Not Null
		,Constraint FK_LogCestProdDep_Prod Foreign Key (cd_Produto) References Produto (cd_Produto) 	
	,cd_Dependente Int Not Null	
		,Constraint FK_LogCestProdDep_Dep Foreign Key (cd_Dependente) References Dependente (cd_Dependente) 
		,Constraint PK_LogCestProdDep Primary Key (cd_LogCestaProdutoDependente)
	,dt_Inclusao SmalldateTime Not Null
	,ic_Ativo bit Not Null
	,ds_Log						VARCHAR(100)		NULL
	,tp_Operacao				CHAR(1)			NOT NULL	
	,dt_Cadastro				SmallDateTime		NULL
	,dt_Alteracao				SmallDateTime		NULL	
	,dt_Desativacao				SmallDateTime		NULL
	,cd_Usuario					Int				NOT NULL
		,Constraint FK_LogCestProdDep_Usuario Foreign Key (cd_Usuario) References Usuario (cd_Usuario)
);