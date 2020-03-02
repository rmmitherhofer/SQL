USE DPTec

GO

Create Table LogFuncionario
(
    cd_LogFuncionario Int Identity NOT NULL
      ,Constraint PK_LogFunc Primary Key (cd_LogFuncionario) 
    ,cd_Matricula int Not Null
      ,Constraint FK_LogFunc_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula) 
    ,nm_Funcionario Varchar (80) Not Null
    ,no_Telefone numeric(10) null
    ,no_TelCelular numeric(11) null
    ,no_TelComercial numeric(10) null
    ,no_Ramal numeric(4) null
    ,ds_email Varchar(100) Null
    ,ds_emailCom Varchar(100) Null
    ,nm_Mae Varchar (80)Not Null
    ,nm_Pai Varchar (80)Null
    ,ds_Nacionalidade Varchar(40) Not Null 
    ,ds_Naturalidade Varchar (50) Not Null
    ,dt_Nascimento date Not Null
    ,ds_Sexo Varchar (9) Not Null
    ,cd_EstadoCivil int Not Null
      ,Constraint FK_LogFunc_EstCivil Foreign Key (cd_EstadoCivil) References EstadoCivil (cd_EstadoCivil) 
    ,nm_Conjuge Varchar(80)Null
    ,ds_NecesEspecial	Varchar(40) Not Null
    ,no_CTPS numeric(8) Not Null    
    ,no_Serie numeric(8) Not Null
    ,sg_UF_CTPS Char (2) Not Null
    ,dt_Expedicao date Not Null
    ,no_PIS numeric (13) Not Null
    ,no_RG Varchar(11) Not Null
    ,ds_OrgExp Varchar(4) Not Null
    ,dt_Expedicao_RG date Not Null
    ,no_CPF numeric (11) Not Null
    ,no_Tit_Eleitor numeric(15) Not Null
    ,no_Zona int Not Null
    ,no_Secao int Not Null
    ,no_Reservista numeric (6) null
    ,no_RA_Reservista numeric (12) null
    ,sg_Serie_Reservista Char (1) null
    ,ts_Admissao SmallDateTime Not Null
    ,ts_Desligamento SmallDateTime null
    ,cd_Cargo Int Not Null
      ,Constraint FK_LogFunc_Cargo Foreign Key (cd_Cargo) References Cargo (cd_Cargo) 
    ,cd_Departamento int Not Null
      ,Constraint FK_LogFunc_Dep Foreign Key (cd_Departamento) References Departamento (cd_Departamento)
    ,tp_Contrato Varchar(12)Not Null
    ,no_CEP Varchar(8)Not Null
      ,Constraint FK_LogFunc_End Foreign Key (no_CEP) References Endereco (no_CEP) 
    ,no_Endereco Varchar(6) not null
    ,nm_Complemento varchar(60) null
    ,cd_Status int Not Null
      ,Constraint FK_LogFuncionario_Status Foreign Key (cd_Status) References Status (cd_Status)
    ,ds_Log						VARCHAR(100)		NULL
	,tp_Operacao				CHAR(1)			NOT NULL	
	,dt_Cadastro				SmallDateTime		NULL
	,dt_Alteracao				SmallDateTime		NULL	
	,dt_Desativacao				SmallDateTime		NULL
	,cd_Usuario					Int NOT NULL
      ,Constraint FK_LogFunc_Usuario Foreign Key (cd_Usuario) References Usuario (cd_Usuario)
);