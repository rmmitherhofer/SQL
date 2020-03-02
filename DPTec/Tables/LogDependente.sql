USE DPTec

GO

Create Table LogDependente
	(
		cd_LogDependente			Int		Identity NOT NULL
			,Constraint PK_cdLogDependente Primary Key (cd_LogDependente)
		,cd_Dependente				Int				NOT NULL
			,Constraint FK_LogDep_Dep Foreign Key (cd_Dependente) References Dependente (cd_Dependente)
		,cd_Matricula				Int				NOT NULL
			,Constraint FK_LogDep_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula)
		,nm_Dependente				VARCHAR(60)		NOT NULL
		,ds_Sexo					VARCHAR(9)		NOT NULL
		,ds_Parentesco				VARCHAR(10)		NOT NULL
		,ds_Nacionalidade			VARCHAR(40)		NOT NULL
		,dt_Nascimento				Date		NOT NULL
		,ds_NecesEspecial			VARCHAR(40)		NOT NULL
		,nm_Mae						VARCHAR(60)		NOT NULL
		,no_CPF						Numeric(11)		NOT NULL
		,no_RG						VARCHAR(12)		NOT NULL
		,ds_OrgExp					VARCHAR(4)		NOT NULL
		,dt_ExpRG					Date			NOT NULL
		,cd_Status					Int				NOT NULL
			,Constraint FK_LogDep_Status Foreign Key (cd_Status) References Status (cd_Status)
		,ds_Log						VARCHAR(100)		NULL
		,tp_Operacao				CHAR(1)			NOT NULL	
		,dt_Cadastro				SmallDateTime		NULL
		,dt_Alteracao				SmallDateTime		NULL	
		,dt_Desativacao				SmallDateTime		NULL
		,cd_Usuario					Int				NOT NULL
			,Constraint FK_LogDep_Usuario Foreign Key (cd_Usuario) References Usuario (cd_Usuario)
	);