USE DPTec

GO

Create table Dependente
(
	cd_Dependente	 Int Identity Not Null
		,Constraint PK_Depe_cd_Dependente Primary Key (cd_Dependente)
	,cd_Matricula Int Not Null
		,Constraint FK_Dep_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula) 
	,nm_Dependente Varchar(80) Not Null
	,ds_Sexo Varchar(9) Not Null
	,ds_Parentesco	Varchar(10) Not Null
	,ds_Nacionalidade Varchar(40) Not Null
	,dt_Nascimento	 Date Not Null
	,ds_NecesEspecial	Varchar(40) Not Null
	,nm_Mae Varchar(80) Not Null
	,no_CPF Numeric(11) Unique Not Null
	,no_RG	Varchar (11) Unique Not Null
	,ds_OrgExp Varchar(4) Not Null
	,dt_ExpRG	Date Not Null
	,cd_Status	Int Not Null
		,Constraint FK_Dep_Status Foreign Key (cd_Status) References Status (cd_Status) 
);