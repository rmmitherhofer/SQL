USE DPTec

GO

Create Table EstadoCivil
(
    cd_EstadoCivil Int Identity Not Null
    ,ds_EstadoCivil Varchar (20) Not Null
    ,ic_Ativo Bit Not Null
      ,Constraint PK_EstadoCivil_cd_EstadoCivil Primary Key (cd_EstadoCivil)
);