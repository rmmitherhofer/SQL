USE DPTec

GO


Create Table CestaProdutoDependente
(
	cd_CestaBeneficio Int Unique Identity Not Null		
	,cd_Produto Int Not Null
		,Constraint FK_CestProdDep_Prod Foreign Key (cd_Produto) References Produto (cd_Produto) 	
	,cd_Dependente Int Not Null	
		,Constraint FK_CestProdDep_Dep Foreign Key (cd_Dependente) References Dependente (cd_Dependente) 
		,Constraint PK_CestProdDep Primary Key (cd_Produto, cd_Dependente)
	,dt_Inclusao SmalldateTime Not Null
	,ic_Ativo bit Not Null
);