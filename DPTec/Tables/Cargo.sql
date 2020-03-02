USE DPTec

GO

Create Table Cargo
(
    cd_Cargo Int Identity Not Null
    ,ds_Cargo Varchar (60) Not Null
    ,ic_Ativo Bit Not Null
      ,Constraint PK_Cargo_cd_Cargo Primary Key (cd_Cargo)
);