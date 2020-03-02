USE DPTec

GO

Create table DetalhamentoPonto
(
    cd_DetalhamentoPonto Int  Identity Not Null
      ,Constraint PK_DetalPonto_cd_DetalPonto Primary Key (cd_DetalhamentoPonto)
    ,cd_Ponto Int Not Null
      ,Constraint FK_DetalPonto_Ponto Foreign Key (cd_Ponto) References Ponto (cd_Ponto) 
    ,dt_Data Date Not Null
    ,ds_DiaSemana int Not Null
    ,ic_Abono Bit Not Null
    ,ic_Debito_Banco Bit Not Null
    ,ic_Debito_Salario Bit Not Null
    ,hr_Entrada SmallDateTime Null
    ,hr_Saida_Almoco SmallDateTime Null
    ,hr_Volta_Almoco SmallDateTime Null
    ,hr_Saida SmallDateTime Null
    ,ds_Observacao Varchar(200) Null
	,hr_Entrada_Padrao SmallDateTime Null
    ,hr_Saida_Almoco_Padrao SmallDateTime Null
    ,hr_Volta_Almoco_Padrao SmallDateTime Null
    ,hr_Saida_Padrao SmallDateTime Null
);