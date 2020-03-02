USE DPTec

GO


Create Table HorasVigente
(
	cd_HoraVigente int Identity Primary Key
	,hr_Entrada time NULL
	,hr_Saida_Almoco time NULL
	,hr_Volta_Almoco time NULL
	,hr_Saida time NULL
	,ic_Semana int NULL
	,ic_ativo Bit NOT NULL
)