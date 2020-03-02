USE DPTec

GO

Create Table DadosCurricular
(
    cd_Curricular Int Identity Not Null
      ,Constraint PK_Curriculo Primary Key (cd_Curricular)
    ,cd_Matricula Int Not Null
      ,Constraint FK_Curriculo_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula)
    ,cd_Categoria Int Not Null
      ,Constraint FK_Curriculo_Cat Foreign Key (cd_Categoria) references Categoria (cd_Categoria)
    ,nm_Local Varchar(80)Not Null  
    ,ds_Curricular Varchar(1000) Not Null
    ,dt_Inicio Date Not Null
    ,dt_Conclusao Date Null
    ,cd_Status Int Not Null
      ,Constraint FK_Curriculo_Status Foreign Key (cd_Status) References Status (cd_Status)
);