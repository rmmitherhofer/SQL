USE DPTec

GO

Create table Ponto
(
    cd_Ponto Int Identity Not Null
      ,Constraint PK_Ponto_cd_Ponto Primary Key (cd_Ponto) 
    ,cd_Matricula Int  Not Null
      ,Constraint FK_Ponto_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula)
    ,ds_Mes Int Not Null
    ,dt_PeriodoInicio Date Not Null
    ,dt_PeriodoFim Date Not Null
    ,cd_Status Int Not Null
	,hr_Saldo_Referencia Varchar(10) Null
    ,hr_Saldo Varchar (10) Null
);