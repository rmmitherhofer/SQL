USE DPTec

GO

Create Table Departamento
(
    cd_Departamento Int Identity Not Null
    ,ds_Departamento Varchar(35) Not Null
    ,cd_CCusto Varchar(8) Not Null
    ,cd_Matricula Int Null
    ,ic_Ativo Bit Not Null
      ,Constraint PK_Dep_cd_Departamento Primary Key (cd_Departamento)
);