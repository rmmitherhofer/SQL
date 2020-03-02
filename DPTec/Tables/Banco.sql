USE DPTec

GO


Create Table Banco
(
	cd_Banco Int Primary Key Not Null
	,nm_Banco Varchar(200) Not Null
	,sg_Sigla Varchar(20) Null
	,ds_Competencia varchar(20) Not Null
	,ds_WebSite varchar(200) Not Null
	,ic_Ativo Bit Not Null
)