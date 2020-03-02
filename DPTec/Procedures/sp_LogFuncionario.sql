USE DPtec

GO

create PROCEDURE sp_LogFuncionario
(
	@cdMatricula  Int
    ,@cdUsuario	  Int
    ,@tpOperacao	char(1)
  )
AS
Declare
    @cd_Matricula int
    ,@nmFuncionario Varchar (80)
    ,@noTelefone numeric(10)
    ,@noTelCelular numeric(11)
    ,@noTelComercial numeric(10)
    ,@noRamal numeric(4)
    ,@dsemail Varchar(100)
    ,@dsemailCom Varchar(100)
    ,@nmMae Varchar (80) 
    ,@nmPai Varchar (80)
    ,@dsNacionalidade Varchar(40)   
    ,@dsNaturalidade Varchar (50)  
    ,@dtNascimento date
    ,@dsSexo Varchar(9)  
    ,@cdEstadoCivil int  
    ,@nmConjuge Varchar(80)
    ,@dsNecesEspecial	Varchar(40)  
    ,@noCTPS numeric(8)       
    ,@noSerie numeric(8)  
    ,@sgUF_CTPS Char (2)  
    ,@dtExpedicao date
	,@noPIS numeric (13)   
    ,@noRG Varchar(11)   
    ,@dsOrgExp Varchar(4)  
    ,@dtExpedicao_RG date 
    ,@noCPF numeric (11)   
    ,@noTit_Eleitor numeric(15)   
    ,@noZona int  
    ,@noSecao int  
    ,@noReservista numeric (6)  
    ,@noRA_Reservista numeric (12) 
    ,@sgSerie_Reservista Char (1) 
    ,@tsAdmissao SmallDateTime  
    ,@tsDesligamento SmallDateTime 
    ,@cdCargo Int  
    ,@cdDepartamento int  
    ,@tpContrato Varchar(12) 
    ,@noCEP Varchar(8) 
    ,@noEndereco Varchar(6)  
    ,@nmComplemento varchar(60) 
    ,@cdStatus int
	,@dsLog Varchar(200)
    ,@dtCadastro SmallDateTime		
    ,@dtAlteracao SmallDateTime			
    ,@dtDesativacao	SmallDateTime
BEGIN 
    Select @cd_Matricula = cd_Matricula 
			,@nmFuncionario = nm_Funcionario
			,@noTelefone = no_Telefone
			,@noTelCelular = no_TelCelular
			,@noTelComercial = no_TelComercial
			,@noRamal = no_Ramal
			,@dsemail = ds_email
			,@dsemailCom = ds_emailCom
			,@nmMae = nm_Mae
			,@nmPai = nm_Pai
			,@dsNacionalidade = ds_Nacionalidade
			,@dsNaturalidade = ds_Naturalidade
			,@dtNascimento = dt_Nascimento
			,@dsSexo = ds_Sexo
			,@cdEstadoCivil = cd_EstadoCivil
			,@nmConjuge = nm_Conjuge
			,@dsNecesEspecial = ds_NecesEspecial	
			,@noCTPS = no_CTPS
			,@noSerie = no_Serie
			,@sgUF_CTPS = sg_UF_CTPS 
			,@dtExpedicao = dt_Expedicao
			,@noPIS = no_PIS
			,@noRG = no_RG
			,@dsOrgExp = ds_OrgExp
			,@dtExpedicao_RG = dt_Expedicao_RG
			,@noCPF = no_CPF
			,@noTit_Eleitor = no_Tit_Eleitor
			,@noZona = no_Zona 
			,@noSecao = no_Secao 
			,@noReservista = no_Reservista
			,@noRA_Reservista = no_RA_Reservista
			,@sgSerie_Reservista = sg_Serie_Reservista
			,@tsAdmissao = ts_Admissao
			,@tsDesligamento = ts_Desligamento
			,@cdCargo = cd_Cargo 
			,@cdDepartamento = cd_Departamento 
			,@tpContrato = tp_Contrato
			,@noCEP = no_CEP
			,@noEndereco = no_Endereco
			,@nmComplemento = nm_Complemento
			,@cdStatus = cd_Status 			      
      From Funcionario
      Where 
          cd_Matricula = @cdMatricula
          
IF @tpOperacao != 'I'
	Begin  
      Select Top 1
        @dtCadastro = dt_Cadastro
      From
        LogFuncionario
      where cd_Matricula = @cdMatricula
            and tp_Operacao = 'I'
      order by dt_Cadastro desc
	End
          
    IF (@tpOperacao = 'I' or @tpOperacao = 'i')
		Begin
			Set @dsLog = 'Inclusão de Funcionario'
			Set @dtCadastro	= GetDate()
			Set @dtAlteracao = null	
			Set @dtDesativacao = null
		End     
    else if (@tpOperacao = 'U' or @tpOperacao = 'u')
		Begin
			Set @dsLog = 'Alteração Dados Cadastrais de Funcionario'	
			Set @dtAlteracao = GetDate()	
			Set @dtDesativacao = null
		End
    else if (@tpOperacao = 'D' or @tpOperacao = 'd')
		begin
			Set @dsLog = 'Desativaçao (Exclusao Lógica) de Funcionario'
			Set @dtAlteracao = GetDate()	
			Set @dtDesativacao = GetDate()
		End 
    
	if @noCPF is Not NULL
		Begin    
		Insert Into LogFuncionario
			(
				cd_Matricula 
				,nm_Funcionario
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
				,ts_Desligamento
				,cd_Cargo 
				,cd_Departamento 
				,tp_Contrato
				,no_CEP
				,no_Endereco
				,nm_Complemento
				,cd_Status		
				,ds_Log				
				,tp_Operacao		
				,dt_Cadastro			
				,dt_Alteracao		
				,dt_Desativacao		
				,cd_Usuario					
			) 
			VALUES (
				@cd_Matricula
				,@nmFuncionario
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
				,@dtNascimento
				,@dsSexo
				,@cdEstadoCivil
				,@nmConjuge
				,@dsNecesEspecial
				,@noCTPS   
				,@noSerie
				,@sgUF_CTPS
				,@dtExpedicao
				,@noPIS
				,@noRG
				,@dsOrgExp
				,@dtExpedicao_RG
				,@noCPF
				,@noTit_Eleitor
				,@noZona
				,@noSecao
				,@noReservista
				,@noRA_Reservista
				,@sgSerie_Reservista
				,@tsAdmissao
				,@tsDesligamento
				,@cdCargo
				,@cdDepartamento
				,@tpContrato
				,@noCEP
				,@noEndereco
				,@nmComplemento
				,@cdStatus
				,@dsLog				
				,@tpOperacao		
				,@dtCadastro		
				,@dtAlteracao		
				,@dtDesativacao		
				,@cdUsuario			
			)
		end
	else
		raiserror ('ATENÇÃO! Falha ao Gerar Log de Funcionario',1,18)
		return -1
End 