--Create Database DPtec
use DPTec
/*
Drop Table HorasVigente;
Drop table CestaProdutoDependente;
Drop Table LogCestaProdutoDependente
Drop table CestaProdutoFuncionario;
Drop table LogCestaProdutoFuncionario;
Drop table DetalhePagamento;
Drop table Produto;
Drop table Pagamento;
Drop table Financas;
Drop Table Banco;
Drop table PerfilUsuario;
Drop table Perfil;
Drop table DetalhamentoPonto_Competencia;
Drop table Competencia;
Drop table DetalhamentoPonto;
Drop table Ponto;
Drop table LogDependente;
Drop table Dependente;
Drop Table DadosCurricular;
Drop Table LogFuncionario;
Drop table Funcionario;
Drop table Empresa;
Drop table Departamento;
Drop table Cargo;
Drop table EstadoCivil;
Drop table Endereco;
Drop table Status;
Drop table Categoria;
Drop table Usuario;

Select * from  HorasVigente;
Select * from  CestaProdutoDependente;
Select * from  CestaProdutoFuncionario;
Select * from  DetalhePagamento;
Select * from  Produto;
Select * from  Pagamento;
Select * from  Empresa;
Select * from  Financas;
Select * from  PerfilUsuario;
Select * from  Perfil;
Select * from  DetalhamentoPonto_Competencia;
Select * from  Competencia;
Select * from  DetalhamentoPonto;
Select * from  Ponto;
Select * from  lOGDependente;
Select * from  Dependente;
Select * from  Usuario;
Select * from  DadosCurricular;
Select * from  Funcionario;
Select * from  Departamento;
Select * from  Cargo;
Select * from  EstadoCivil;
Select * from  Endereco;
Select * from  Status;
Select * from  Categoria;
select * from wvConsultaFuncionario where Func_CD_Matricula = 1

*/
---- Para cadastro da categoria das coisas
Create Table Categoria
(
    cd_Categoria int Identity
    ,ds_Categoria Varchar(90) Not Null
    ,ic_Ativo Bit Not Null
      ,Constraint PK_Categoria_cd_Categoria Primary Key(cd_Categoria) 
);

Create Table Status
(
    cd_Status Int Identity Not Null
    ,ds_Status Varchar(22) Not Null
    ,ic_Ativo Bit Not Null
      ,Constraint PK_Status_cd_Status Primary Key (cd_Status)
);

-- Para cadastro de Endereço
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

Create Table EstadoCivil
(
    cd_EstadoCivil Int Identity Not Null
    ,ds_EstadoCivil Varchar (20) Not Null
    ,ic_Ativo Bit Not Null
      ,Constraint PK_EstadoCivil_cd_EstadoCivil Primary Key (cd_EstadoCivil)
);

Create Table Cargo
(
    cd_Cargo Int Identity Not Null
    ,ds_Cargo Varchar (60) Not Null
    ,ic_Ativo Bit Not Null
      ,Constraint PK_Cargo_cd_Cargo Primary Key (cd_Cargo)
);

Create Table Departamento
(
    cd_Departamento Int Identity Not Null
    ,ds_Departamento Varchar(35) Not Null
    ,cd_CCusto Varchar(8) Not Null
    ,cd_Matricula Int Null
    ,ic_Ativo Bit Not Null
      ,Constraint PK_Dep_cd_Departamento Primary Key (cd_Departamento)
);

Create table Empresa
(
	cd_Empresa Int Identity Not Null
		,Constraint PK_Emp_cd_Empresa Primary Key (cd_Empresa)
	,nm_Fantasia varchar(100)not null
	,nm_Razao_Social Varchar(100) not null
	,no_CNPJ numeric (15) Unique not null
	,no_Insc_Estadual numeric (15) Unique not null
	,nm_Segmento varchar(30) not null
	,ts_Abertura SmallDateTime not null
	,ts_Fechamento SmallDateTime null
	,cd_Status int Not Null
		,Constraint FK_Emp_Status Foreign Key (cd_Status) References Status (cd_Status) 
	,nm_Site Varchar(120) not null
	,cd_Categoria int Not Null
		,Constraint FK_Emp_Categoria Foreign Key (cd_Categoria) References Categoria (cd_Categoria) 
	,no_CEP Varchar(8)Not Null 
		,Constraint FK_Emp_Endereco Foreign Key (no_CEP) References Endereco (no_CEP) 
	,no_Endereco Varchar(6) not null
	,nm_Complemento varchar(60) null
	,no_Telefone_SAC numeric(11) not null
	,no_Telefone_Ouvidoria numeric(11) not null
	,nm_Pais_Origem Varchar(15) not null
);

Create Table Funcionario
(
    cd_Matricula int Identity Not Null
		,Constraint PK_Func_cd_Mat Primary Key (cd_Matricula) 
    ,nm_Funcionario Varchar (80) Not Null
    ,no_Telefone numeric(10) null
    ,no_TelCelular numeric(11) null
    ,no_TelComercial numeric(10) null
    ,no_Ramal numeric(4) null
    ,ds_email Varchar(100) Null
    ,ds_emailCom Varchar(100) Null
    ,nm_Mae Varchar (80)Not Null
    ,nm_Pai Varchar (80)Null
    ,ds_Nacionalidade Varchar(40) Not Null 
    ,ds_Naturalidade Varchar (50) Not Null
    ,dt_Nascimento date Not Null
    ,ds_Sexo Varchar (9) Not Null
		,Constraint CK_Func_ds_Sexo Check (ds_Sexo in ('Feminino', 'Masculino')) 
    ,cd_EstadoCivil int Not Null
		,Constraint FK_Func_EstCivil Foreign Key (cd_EstadoCivil) References EstadoCivil (cd_EstadoCivil) 
    ,nm_Conjuge Varchar(80)Null
    ,ds_NecesEspecial	Varchar(40) Not Null
    ,no_CTPS numeric(8) unique Not Null    
    ,no_Serie numeric(8) Not Null
    ,sg_UF_CTPS Char (2) Not Null
    ,dt_Expedicao date Not Null
    ,no_PIS numeric (13) unique Not Null
    ,no_RG Varchar(11) unique Not Null
    ,ds_OrgExp Varchar(4) Not Null
    ,dt_Expedicao_RG date Not Null
    ,no_CPF numeric (11) unique Not Null
    ,no_Tit_Eleitor numeric(15) unique Not Null
    ,no_Zona int Not Null
    ,no_Secao int Not Null
    ,no_Reservista numeric (6) Unique null
    ,no_RA_Reservista numeric (12) null
    ,sg_Serie_Reservista Char (1) null
    ,ts_Admissao SmallDateTime Not Null
    ,ts_Desligamento SmallDateTime null
    ,cd_Cargo Int Not Null
		,Constraint FK_Func_Cargo Foreign Key (cd_Cargo) References Cargo (cd_Cargo) 
    ,cd_Departamento int Not Null
		,Constraint FK_Func_Dep Foreign Key (cd_Departamento) References Departamento (cd_Departamento)
    ,tp_Contrato Varchar(12)Not Null
    ,no_CEP Varchar(8)Not Null
		,Constraint FK_Func_End Foreign Key (no_CEP) References Endereco (no_CEP) 
    ,no_Endereco Varchar(6) not null
    ,nm_Complemento varchar(60) null
    ,cd_Status int Not Null
		,Constraint FK_Funcionario_Status Foreign Key (cd_Status) References Status (cd_Status)
	,cd_Empresa int 
		,Constraint FK_Funcionario_Emp Foreign Key (cd_Empresa) References Empresa (cd_Empresa)
);

Create Table Usuario
(
    cd_Usuario Int Identity Not Null
		,Constraint PK_Usuario_cd_Usuario Primary Key (cd_Usuario) 
    ,nm_Usuario Varchar(80) Not Null
    ,ds_Login Varchar (20) Not Null
    ,ds_Senha Varchar (12) Not Null
	,cd_Matricula int Null
    ,ic_Ativo Bit Not Null
);

Create Table LogFuncionario
(
    cd_LogFuncionario Int Identity NOT NULL
      ,Constraint PK_LogFunc Primary Key (cd_LogFuncionario) 
    ,cd_Matricula int Not Null
      ,Constraint FK_LogFunc_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula) 
    ,nm_Funcionario Varchar (80) Not Null
    ,no_Telefone numeric(10) null
    ,no_TelCelular numeric(11) null
    ,no_TelComercial numeric(10) null
    ,no_Ramal numeric(4) null
    ,ds_email Varchar(100) Null
    ,ds_emailCom Varchar(100) Null
    ,nm_Mae Varchar (80)Not Null
    ,nm_Pai Varchar (80)Null
    ,ds_Nacionalidade Varchar(40) Not Null 
    ,ds_Naturalidade Varchar (50) Not Null
    ,dt_Nascimento date Not Null
    ,ds_Sexo Varchar (9) Not Null
    ,cd_EstadoCivil int Not Null
      ,Constraint FK_LogFunc_EstCivil Foreign Key (cd_EstadoCivil) References EstadoCivil (cd_EstadoCivil) 
    ,nm_Conjuge Varchar(80)Null
    ,ds_NecesEspecial	Varchar(40) Not Null
    ,no_CTPS numeric(8) Not Null    
    ,no_Serie numeric(8) Not Null
    ,sg_UF_CTPS Char (2) Not Null
    ,dt_Expedicao date Not Null
    ,no_PIS numeric (13) Not Null
    ,no_RG Varchar(11) Not Null
    ,ds_OrgExp Varchar(4) Not Null
    ,dt_Expedicao_RG date Not Null
    ,no_CPF numeric (11) Not Null
    ,no_Tit_Eleitor numeric(15) Not Null
    ,no_Zona int Not Null
    ,no_Secao int Not Null
    ,no_Reservista numeric (6) null
    ,no_RA_Reservista numeric (12) null
    ,sg_Serie_Reservista Char (1) null
    ,ts_Admissao SmallDateTime Not Null
    ,ts_Desligamento SmallDateTime null
    ,cd_Cargo Int Not Null
      ,Constraint FK_LogFunc_Cargo Foreign Key (cd_Cargo) References Cargo (cd_Cargo) 
    ,cd_Departamento int Not Null
      ,Constraint FK_LogFunc_Dep Foreign Key (cd_Departamento) References Departamento (cd_Departamento)
    ,tp_Contrato Varchar(12)Not Null
    ,no_CEP Varchar(8)Not Null
      ,Constraint FK_LogFunc_End Foreign Key (no_CEP) References Endereco (no_CEP) 
    ,no_Endereco Varchar(6) not null
    ,nm_Complemento varchar(60) null
    ,cd_Status int Not Null
      ,Constraint FK_LogFuncionario_Status Foreign Key (cd_Status) References Status (cd_Status)
    ,ds_Log						VARCHAR(100)		NULL
	,tp_Operacao				CHAR(1)			NOT NULL	
	,dt_Cadastro				SmallDateTime		NULL
	,dt_Alteracao				SmallDateTime		NULL	
	,dt_Desativacao				SmallDateTime		NULL
	,cd_Usuario					Int NOT NULL
      ,Constraint FK_LogFunc_Usuario Foreign Key (cd_Usuario) References Usuario (cd_Usuario)
);

Create Table DadosCurricular
(
    cd_Curricular Int Identity Not Null
      ,Constraint PK_Curriculo Primary Key (cd_Curricular)
    ,cd_Matricula Int Not Null
      ,Constraint FK_Curriculo_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula)
    ,cd_Categoria Int Not Null
      ,Constraint FK_Curriculo_Cat Foreign Key (cd_Categoria) references Categoria (cd_Categoria)
    ,nm_Local Varchar(80)Not Null  
    ,ds_Curricular Varchar(1000) Not Null
    ,dt_Inicio Date Not Null
    ,dt_Conclusao Date Null
    ,cd_Status Int Not Null
      ,Constraint FK_Curriculo_Status Foreign Key (cd_Status) References Status (cd_Status)
);

Create table Dependente
(
	cd_Dependente	 Int Identity Not Null
		,Constraint PK_Depe_cd_Dependente Primary Key (cd_Dependente)
	,cd_Matricula Int Not Null
		,Constraint FK_Dep_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula) 
	,nm_Dependente Varchar(80) Not Null
	,ds_Sexo Varchar(9) Not Null
	,ds_Parentesco	Varchar(10) Not Null
	,ds_Nacionalidade Varchar(40) Not Null
	,dt_Nascimento	 Date Not Null
	,ds_NecesEspecial	Varchar(40) Not Null
	,nm_Mae Varchar(80) Not Null
	,no_CPF Numeric(11) Unique Not Null
	,no_RG	Varchar (11) Unique Not Null
	,ds_OrgExp Varchar(4) Not Null
	,dt_ExpRG	Date Not Null
	,cd_Status	Int Not Null
		,Constraint FK_Dep_Status Foreign Key (cd_Status) References Status (cd_Status) 
);

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

Create Table Competencia
(
    cd_Competencia Int Identity Not Null
      ,Constraint PK_Competencia_cd_Competencia Primary Key (cd_Competencia) 
    ,ds_Competencia Varchar(60) Not Null
    ,ic_Ativo Bit Not Null
);


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

Create Table Perfil
(
    cd_Perfil Int Identity Not Null
      ,Constraint PK_Perf_cd_Perfil Primary Key (cd_Perfil) 
    ,tp_Perfil Varchar(200) Not Null
    ,ds_Liberacao Varchar (200) Not Null
    ,ds_Sistema Varchar(60) Not Null
    ,ic_Ativo Bit Not Null
);

Create Table PerfilUsuario
(
    cd_Perfil Int Not Null
      ,Constraint FK_PerfilUser_Perfil Foreign Key (cd_Perfil) References Perfil (cd_Perfil) 
    ,cd_Usuario Int Not Null
      ,Constraint FK_PerfilUser_Usuario Foreign Key (cd_Usuario) References Usuario (cd_Usuario) 
    ,ic_Ativo Bit Not Null
      ,Constraint PK_PerfilUser Primary Key (cd_Perfil, cd_Usuario)
);

Create Table Banco
(
	cd_Banco Int Primary Key Not Null
	,nm_Banco Varchar(200) Not Null
	,sg_Sigla Varchar(20) Null
	,ds_Competencia varchar(20) Not Null
	,ds_WebSite varchar(200) Not Null
	,ic_Ativo Bit Not Null
)

Create Table Financas
(
	cd_Financas Int Identity Not Null
		,Constraint PK_Fin_cd_Fincancas Primary Key (cd_Financas) 
	,tp_Conta Varchar(15) Not Null
	,cd_Banco Int Not Null
		,Constraint FK_Fin_cd_Banco Foreign Key (cd_Banco) References Banco (cd_Banco)
	,no_Agencia Numeric (16) Not Null
	,no_Conta Numeric (18) Not Null
	,no_Digito Int Null
	,cd_Status Int
		,Constraint FK_Fin_Status Foreign Key (cd_Status) References Status (cd_Status) 
	,cd_Matricula Int Not Null
		,Constraint FK_Fin_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula)
	,vl_Salario Decimal(10,2) Not Null
);

Create Table Pagamento
(
    cd_Pagamento Int Identity Not Null
      ,Constraint PK_Pag_cd_Pagamento Primary Key (cd_Pagamento) 
    ,cd_Empresa Int Not Null
      ,Constraint FK_Pag_Empresa Foreign Key (cd_Empresa) References Empresa (cd_Empresa) 
    ,cd_Matricula Int Not Null
      ,Constraint FK_Pag_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula) 
    ,cd_Financas Int Not Null
      ,Constraint FK_Pag_Fin Foreign Key (cd_Financas) References Financas (cd_Financas) 
	,cd_Categoria int
		,Constraint FK_Pag_Cat Foreign Key (cd_Categoria) References Categoria (cd_Categoria)
    ,dt_Referencia Date Not Null
    ,dt_Pagamento Date Not Null
    ,vl_TotalVencidos Decimal (10,2) Null
    ,vl_Descontos Decimal (10,2) Null
    ,vl_Liquidos Decimal (10,2) Null
);


---- Produtos como descontos e acrescimos, ex INSS, FGTS, Adicional Noturno
Create Table Produto
(
	cd_Produto Int Identity Not Null
		,Constraint PK_Prod_cd_Produto Primary Key (cd_Produto) 
	,ds_produto Varchar(70) NOT NULL
	,vl_Produto Decimal (10,2)	NULL
	,pc_Produto Decimal(3,2) NULL
	,cd_Categoria Int Not Null
		,Constraint FK_Prod_Categoria Foreign Key (cd_Categoria) References Categoria (cd_Categoria) 
	,ic_Ativo Char(1) NOT NULL
);


---- Gera o Detalhamento da Cesta com todos os Itens que pertencem a Folha de Pagamento
Create Table DetalhePagamento
(	
    cd_Detalhamento  Int Identity Not Null
		,Constraint PK_DPag_cd_Detal Primary Key (cd_Detalhamento) 
	,cd_Pagamento Int Not Null
		,Constraint FK_DPag_Pagamento Foreign Key (cd_Pagamento) References Pagamento (cd_Pagamento)  
    ,cd_Produto Int Not Null
		,Constraint FK_DPag_Produto Foreign Key (cd_Produto) References Produto (cd_Produto)     
    ,qt_Quantidade Decimal (6,2) Null
    ,vl_Vencimentos Decimal (10,2) Null
    ,vl_Descontos Decimal (10,2) Null
);


---- Gera uma Cesta de Beneficios que um Funcionario pode ter
Create Table CestaProdutoFuncionario
(
	cd_CestaProduto Int Unique Identity Not Null
	,cd_Produto Int Not Null
		,Constraint FK_CestProdFunc_Prod Foreign Key (cd_Produto) References Produto (cd_Produto) 	
	,cd_Matricula Int Not Null
		,Constraint FK_CestProdFunc_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula) 	
		,Constraint PK_CestProdFunc Primary Key (cd_Produto, cd_Matricula)
	,dt_Inclusao SmalldateTime Not Null
	,ic_Ativo bit Not Null
);

Create Table LogCestaProdutoFuncionario
(
	cd_LogCestaProduto Int Unique Identity Not Null
	,cd_CestaProduto Int Not Null
	,cd_Produto Int Not Null
		,Constraint FK_LogCestProdFunc_Prod Foreign Key (cd_Produto) References Produto (cd_Produto) 	
	,cd_Matricula Int Not Null
		,Constraint FK_LogCestProdFunc_Func Foreign Key (cd_Matricula) References Funcionario (cd_Matricula) 	
		,Constraint PK_LogCestProdFunc Primary Key (cd_LogCestaProduto)
	,dt_Inclusao SmalldateTime Not Null
	,ic_Ativo bit Not Null
	,ds_Log						VARCHAR(100)		NULL
	,tp_Operacao				CHAR(1)			NOT NULL	
	,dt_Cadastro				SmallDateTime		NULL
	,dt_Alteracao				SmallDateTime		NULL	
	,dt_Desativacao				SmallDateTime		NULL
	,cd_Usuario					Int				NOT NULL
		,Constraint FK_LogCestProdFunc_Usuario Foreign Key (cd_Usuario) References Usuario (cd_Usuario)
);


---- Gera uma Cesta de Beneficios que um Dependente pode ter
Create Table CestaProdutoDependente
(
	cd_CestaBeneficio Int Unique Identity Not Null		
	,cd_Produto Int Not Null
		,Constraint FK_CestProdDep_Prod Foreign Key (cd_Produto) References Produto (cd_Produto) 	
	,cd_Dependente Int Not Null	
		,Constraint FK_CestProdDep_Dep Foreign Key (cd_Dependente) References Dependente (cd_Dependente) 
		,Constraint PK_CestProdDep Primary Key (cd_Produto, cd_Dependente)
	,dt_Inclusao SmalldateTime Not Null
	,ic_Ativo bit Not Null
);

Create Table LogCestaProdutoDependente
(
	cd_LogCestaProdutoDependente Int Unique Identity Not Null	
	,cd_CestaBeneficio Int		
	,cd_Produto Int Not Null
		,Constraint FK_LogCestProdDep_Prod Foreign Key (cd_Produto) References Produto (cd_Produto) 	
	,cd_Dependente Int Not Null	
		,Constraint FK_LogCestProdDep_Dep Foreign Key (cd_Dependente) References Dependente (cd_Dependente) 
		,Constraint PK_LogCestProdDep Primary Key (cd_LogCestaProdutoDependente)
	,dt_Inclusao SmalldateTime Not Null
	,ic_Ativo bit Not Null
	,ds_Log						VARCHAR(100)		NULL
	,tp_Operacao				CHAR(1)			NOT NULL	
	,dt_Cadastro				SmallDateTime		NULL
	,dt_Alteracao				SmallDateTime		NULL	
	,dt_Desativacao				SmallDateTime		NULL
	,cd_Usuario					Int				NOT NULL
		,Constraint FK_LogCestProdDep_Usuario Foreign Key (cd_Usuario) References Usuario (cd_Usuario)
);

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

---- Gera Log Continuo de cada Acesso e Ação do usuario
--Create Table LogAcesso
--(
--);