USE DPtec

GO

Create PROCEDURE sp_Funcionario
(
	@cdMatricula  int
	,@nmFuncionario  Varchar(80)
	,@noTelefone  numeric(10)
	,@noTelCelular  numeric(11)
	,@noTelComercial  numeric(11)
	,@noRamal  numeric(4)
	,@dsemail  Varchar(100)
	,@dsemailCom  Varchar(100)
	,@nmMae  Varchar(80)
	,@nmPai  Varchar(80)
	,@dsNacionalidade  Varchar(40)
	,@dsNaturalidade  Varchar(50)
	,@dtNascimento Varchar(30)
	,@dsSexo  Varchar (9)
	,@cdEstadoCivil int
	,@nmConjuge  Varchar(80)
	,@dsNecesEspecial	  Varchar(40)
	,@noCTPS  Numeric(8)
	,@noSerie  Numeric(8)
	,@sgUF_CTPS  char(2)
	,@dtExpedicao  Varchar(30)
	,@noPIS  numeric(13)
	,@noRG  Varchar(11)
	,@dsOrgExp  Varchar(4)
	,@dtExpedicao_RG  Varchar(30)
	,@noCPF  Numeric(11)
	,@noTit_Eleitor  numeric(15)
	,@noZona  int
	,@noSecao int
	,@noReservista  numeric (6)
	,@noRA_Reservista  numeric(12)
	,@sgSerie_Reservista  char(1)
	,@tsAdmissao  Varchar(40)
	,@tsDesligamento  Varchar(40)
	,@cdCargo  int
	,@cdDepartamento  int
	,@tpContrato  varchar(12)
	,@noCEP  Varchar(8)
	,@noEndereco  varchar(6)
	,@nmComplemento  varchar(60)
	,@cdStatus   int
	,@Op Char(1)
	,@cdUsuario Int
	,@cdEmpresa Int
  )
As
Declare
	@msg Varchar(200)
	,@cd_Matricula            Int;
 
    


BEGIN   
	IF (@Op = 'I')
	Begin
		Insert Into Funcionario
			(
				nm_Funcionario
				,no_Telefone
				,no_TelCelular
				,no_TelComercial
				,no_Ramal
				,ds_email
				,ds_emailCom
				,nm_Mae
				,nm_Pai
				,ds_Nacionalidade
				,ds_Naturalidade
				,dt_Nascimento
				,ds_Sexo
				,cd_EstadoCivil
				,nm_Conjuge
				,ds_NecesEspecial	
				,no_CTPS
				,no_Serie
				,sg_UF_CTPS 
				,dt_Expedicao
				,no_PIS
				,no_RG
				,ds_OrgExp
				,dt_Expedicao_RG
				,no_CPF
				,no_Tit_Eleitor
				,no_Zona 
				,no_Secao 
				,no_Reservista
				,no_RA_Reservista
				,sg_Serie_Reservista
				,ts_Admissao
				,cd_Cargo 
				,cd_Departamento 
				,tp_Contrato
				,no_CEP
				,no_Endereco
				,nm_Complemento
				,cd_Status
				,cd_Empresa
			) 
			VALUES (
				@nmFuncionario
				,@noTelefone
				,@noTelCelular
				,@noTelComercial
				,@noRamal
				,@dsemail
				,@dsemailCom
				,@nmMae
				,@nmPai
				,@dsNacionalidade
				,@dsNaturalidade
				,Convert(Date, @dtNascimento, 105)
				,@dsSexo
				,@cdEstadoCivil
				,@nmConjuge
				,@dsNecesEspecial	
				,@noCTPS
				,@noSerie
				,@sgUF_CTPS 
				,Convert(Date,@dtExpedicao,105)
				,@noPIS
				,@noRG
				,@dsOrgExp
				,Convert(Date,@dtExpedicao_RG,105)
				,@noCPF
				,@noTit_Eleitor
				,@noZona 
				,@noSecao 
				,@noReservista
				,@noRA_Reservista
				,@sgSerie_Reservista
				,GetDate()
				,@cdCargo 
				,@cdDepartamento 
				,@tpContrato
				,@noCEP
				,@noEndereco
				,@nmComplemento
				,@cdStatus
				,@cdEmpresa
			);
    
  		-- Busca Informações do Dependente para gerar LOG  
		Select 
			  @cd_Matricula = cd_Matricula
		  From Funcionario
		  Where 
			  no_CPF = @noCPF;
				
		if @cd_Matricula is not Null
			Begin
	  --Inclusão de Log De Alteração
			Exec sp_LogFuncionario @cd_Matricula
						,@cdUsuario
						,@Op
			End    
		Else
		  Raiserror ('ATENÇÃO! Falha ao gerar Log de Inclusão de Funcionário',1,18)
		  Return -1
	End
	IF(@Op= 'U')
	Begin
    --Executa as Alteraçoes Solicitadas
		Update Funcionario
			Set 
				nm_Funcionario = @nmFuncionario
				,no_Telefone = @noTelefone
				,no_TelCelular = @noTelCelular
				,no_TelComercial = @noTelComercial
				,no_Ramal = @noRamal
				,ds_email = @dsemail
				,ds_emailCom = @dsemailCom
				,dt_Nascimento = Convert(Date, @dtNascimento,105)
				,cd_EstadoCivil = @cdEstadoCivil
				,nm_Conjuge = @nmConjuge
				,ds_NecesEspecial	 = @dsNecesEspecial
				,no_CTPS = @noCTPS
				,no_Serie = @noSerie
				,sg_UF_CTPS  = @sgUF_CTPS
				,dt_Expedicao = Convert(Date,@dtExpedicao, 105)
				,ds_OrgExp = @dsOrgExp
				,dt_Expedicao_RG = Convert(Date,@dtExpedicao_RG, 105)
				,no_Tit_Eleitor = @noTit_Eleitor
				,no_Zona  = @noZona
				,no_Secao  = @noSecao
				,no_Reservista = @noReservista
				,no_RA_Reservista = @noRA_Reservista
				,sg_Serie_Reservista = @sgSerie_Reservista
				,ts_Admissao = Convert(smalldatetime,@tsAdmissao,105)
				,cd_Cargo  = @cdCargo
				,cd_Departamento  = @cdDepartamento
				,tp_Contrato = @tpContrato
				,no_CEP = @noCEP
				,no_Endereco = @noEndereco 
				,nm_Complemento = @nmComplemento 
				,cd_Status = @cdStatus
			where 
				cd_Matricula = @cdMatricula;
            
    --Inclusão de Log De Alteração
		
		Exec sp_LogFuncionario @cdMatricula
                    ,@cdUsuario
                    ,@Op
	End

	IF(@Op = 'D')
	Begin
    --Realiza Exclusão Logica
				Update Funcionario
					Set 
						cd_Status = 5
						,ts_Desligamento = Getdate()
					where 
						cd_Matricula = @cdMatricula;

				Update Usuario
					Set
						ic_Ativo = 0
					where 
						cd_Matricula = @cdMatricula;
            
    --Inclusão de Log De Alteração
		exec sp_LogFuncionario @cdMatricula
                    ,@cdUsuario		
                    ,@Op	

	End
End