USE DPTec

GO

---- Produtos como descontos e acrescimos, ex INSS, FGTS, Adicional Noturno
Create Table Produto
(
	cd_Produto Int Identity Not Null
		,Constraint PK_Prod_cd_Produto Primary Key (cd_Produto) 
	,ds_produto Varchar(70) NOT NULL
	,vl_Produto Decimal (10,2)	NULL
	,pc_Produto Decimal(3,2) NULL
	,cd_Categoria Int Not Null
		,Constraint FK_Prod_Categoria Foreign Key (cd_Categoria) References Categoria (cd_Categoria) 
	,ic_Ativo Char(1) NOT NULL
);