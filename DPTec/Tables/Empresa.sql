USE DPTec

GO

Create table Empresa
(
	cd_Empresa Int Identity Not Null
		,Constraint PK_Emp_cd_Empresa Primary Key (cd_Empresa)
	,nm_Fantasia varchar(100)not null
	,nm_Razao_Social Varchar(100) not null
	,no_CNPJ numeric (15) Unique not null
	,no_Insc_Estadual numeric (15) Unique not null
	,nm_Segmento varchar(30) not null
	,ts_Abertura SmallDateTime not null
	,ts_Fechamento SmallDateTime null
	,cd_Status int Not Null
		,Constraint FK_Emp_Status Foreign Key (cd_Status) References Status (cd_Status) 
	,nm_Site Varchar(120) not null
	,cd_Categoria int Not Null
		,Constraint FK_Emp_Categoria Foreign Key (cd_Categoria) References Categoria (cd_Categoria) 
	,no_CEP Varchar(8)Not Null 
		,Constraint FK_Emp_Endereco Foreign Key (no_CEP) References Endereco (no_CEP) 
	,no_Endereco Varchar(6) not null
	,nm_Complemento varchar(60) null
	,no_Telefone_SAC numeric(11) not null
	,no_Telefone_Ouvidoria numeric(11) not null
	,nm_Pais_Origem Varchar(15) not null
);