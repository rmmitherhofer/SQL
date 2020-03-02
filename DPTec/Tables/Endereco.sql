USE DPTec

GO

-- Para cadastro de Endere�o
Create Table Endereco
(
    no_CEP Varchar(8) Not Null
    ,nm_Logradouro Varchar (100) Not Null
    ,nm_Bairro Varchar (90) Not Null
    ,nm_Cidade Varchar (80) Not Null
    ,sg_UF Char (2) Not Null
    ,nm_Pais Varchar(60) Not Null
    ,ic_Ativo Bit Not Null
      ,Constraint PK_Endereco_no_CEP Primary Key (no_CEP)
);