USE DPTec

GO

Create Table Pagamento
(
    cd_Pagamento Int Identity Not Null
      ,Constraint PK_Pag_cd_Pagamento Primary Key (cd_Pagamento) 
    ,cd_Empresa Int Not Null
      ,Constraint FK_Pag_Empresa Foreign Key (cd_Empresa) References Empresa (cd_Empresa) 
    ,cd_Matricula Int Not Null
      ,Constraint FK_Pag_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula) 
    ,cd_Financas Int Not Null
      ,Constraint FK_Pag_Fin Foreign Key (cd_Financas) References Financas (cd_Financas) 
	,cd_Categoria int
		,Constraint FK_Pag_Cat Foreign Key (cd_Categoria) References Categoria (cd_Categoria)
    ,dt_Referencia Date Not Null
    ,dt_Pagamento Date Not Null
    ,vl_TotalVencidos Decimal (10,2) Null
    ,vl_Descontos Decimal (10,2) Null
    ,vl_Liquidos Decimal (10,2) Null
);