USE DPTec

GO
Create Table Status
(
    cd_Status Int Identity Not Null
    ,ds_Status Varchar(22) Not Null
    ,ic_Ativo Bit Not Null
      ,Constraint PK_Status_cd_Status Primary Key (cd_Status)
);