USE DPTec

GO

---- Para cadastro da categoria das coisas
Create Table Categoria
(
    cd_Categoria int Identity
    ,ds_Categoria Varchar(90) Not Null
    ,ic_Ativo Bit Not Null
      ,Constraint PK_Categoria_cd_Categoria Primary Key(cd_Categoria) 
);
