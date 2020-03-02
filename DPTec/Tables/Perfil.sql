USE DPTec

GO

Create Table Perfil
(
    cd_Perfil Int Identity Not Null
      ,Constraint PK_Perf_cd_Perfil Primary Key (cd_Perfil) 
    ,tp_Perfil Varchar(200) Not Null
    ,ds_Liberacao Varchar (200) Not Null
    ,ds_Sistema Varchar(60) Not Null
    ,ic_Ativo Bit Not Null
);
