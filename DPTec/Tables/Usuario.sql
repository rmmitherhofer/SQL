USE DPTec

GO

Create Table Usuario
(
    cd_Usuario Int Identity Not Null
		,Constraint PK_Usuario_cd_Usuario Primary Key (cd_Usuario) 
    ,nm_Usuario Varchar(80) Not Null
    ,ds_Login Varchar (20) Not Null
    ,ds_Senha Varchar (12) Not Null
	,cd_Matricula int Null
    ,ic_Ativo Bit Not Null
);