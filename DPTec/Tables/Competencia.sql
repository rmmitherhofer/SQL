USE DPTec

GO

Create Table Competencia
(
    cd_Competencia Int Identity Not Null
      ,Constraint PK_Competencia_cd_Competencia Primary Key (cd_Competencia) 
    ,ds_Competencia Varchar(60) Not Null
    ,ic_Ativo Bit Not Null
);
