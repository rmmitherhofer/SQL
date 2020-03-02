USE DPTec

GO

---- Gera o Detalhamento da Cesta com todos os Itens que pertencem a Folha de Pagamento
Create Table DetalhePagamento
(	
    cd_Detalhamento  Int Identity Not Null
		,Constraint PK_DPag_cd_Detal Primary Key (cd_Detalhamento) 
	,cd_Pagamento Int Not Null
		,Constraint FK_DPag_Pagamento Foreign Key (cd_Pagamento) References Pagamento (cd_Pagamento)  
    ,cd_Produto Int Not Null
		,Constraint FK_DPag_Produto Foreign Key (cd_Produto) References Produto (cd_Produto)     
    ,qt_Quantidade Decimal (6,2) Null
    ,vl_Vencimentos Decimal (10,2) Null
    ,vl_Descontos Decimal (10,2) Null
);
