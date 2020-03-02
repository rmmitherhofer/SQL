USE DPTec

GO

Create Table DetalhamentoPonto_Competencia
(
    cd_D_Competencia Int Unique Identity Not Null
    ,cd_DetalhamentoPonto Int Not Null
      ,Constraint FK_DPt_Comp_DPt Foreign Key (cd_DetalhamentoPonto) References DetalhamentoPonto (cd_DetalhamentoPonto) 
    ,cd_Competencia Int Not Null
      ,Constraint FK_DPt_Comp_Comp Foreign Key (cd_Competencia) References Competencia (cd_Competencia) 
    ,hr_Quantidade SmallDateTime Not Null
      ,Constraint PK_DPt_Comp_cd_DPt_cd_Comp Primary Key (cd_DetalhamentoPonto, cd_Competencia)
);