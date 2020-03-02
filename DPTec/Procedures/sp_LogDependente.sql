USE DPtec

GO

Create PROCEDURE sp_LogDependente
(
	@cdDependente	  Int
    ,@cdUsuario	   Int
    ,@tpOperacao Char(1)
  )
As

Declare
		@cd_Dependente        Int
		,@mgs Varchar(200)
		,@cdMatricula	        Int
		,@nmDependente	        Varchar(80)
		,@dsSexo               Varchar(9)			
		,@dsParentesco	        Varchar(10)	
		,@dsNacionalidade	    Varchar(40)
		,@dtNascimento	        Date
		,@cdNecesEspecial	    Varchar(40)
		,@nmMae	              Varchar(80)	
		,@noCPF	              Numeric(14)		
		,@noRG		              Varchar (11)	
		,@dsOrgExp	            Varchar(4)		
		,@dtExpRG	            Date	
		,@cdStatus	            Int	
		,@dsLog	              Varchar(200)
		,@dtCadastro		        SmallDateTime		
		,@dtAlteracao			    SmallDateTime			
		,@dtDesativacao		    SmallDateTime
BEGIN 

    Select 
		@cd_Dependente = cd_Dependente
		,@cdMatricula = cd_Matricula		
		,@nmDependente = nm_Dependente	
		,@dsSexo = ds_Sexo			
		,@dsParentesco = ds_Parentesco	
		,@dsNacionalidade = ds_Nacionalidade	
		,@dtNascimento = dt_Nascimento	
		,@cdNecesEspecial = ds_NecesEspecial	
		,@nmMae = nm_Mae			
		,@noCPF = no_CPF			
		,@noRG = no_RG				
		,@dsOrgExp = ds_OrgExp		
		,@dtExpRG = dt_ExpRG
		,@cdStatus = cd_Status        
      From Dependente
      Where 
          cd_Dependente = @cdDependente;
          
IF (@tpOperacao != 'I')
	begin   
      Select top 1
		@dtCadastro = dt_Cadastro
      From
        LogDependente
      where cd_Dependente = @cdDependente
            and tp_Operacao = 'I'
      order by dt_Cadastro desc;
	end

          
    IF (@tpOperacao = 'I' or @tpOperacao = 'i')
		begin 
			Set @dsLog = 'Inclusão de Dependente'
			Set @dtCadastro	= GetDate()
			Set @dtAlteracao = null	
			Set @dtDesativacao = null 
		end       
    else if (@tpOperacao = 'U' or @tpOperacao = 'u')
		Begin
			Set @dsLog = 'Alteração Dados Cadastrais de Dependente'
			Set @dtAlteracao = GetDate()	
			Set @dtDesativacao = null
		End
    else if (@tpOperacao = 'D' or @tpOperacao = 'd')
		Begin
			Set @dsLog = 'Desativaçao (Exclusao Lógica) de Dependente'
			Set @dtAlteracao = GetDate()
			Set @dtDesativacao = GetDate()
		End

    
 if @noCPF is Not NULL 
	Begin 
		Insert Into LogDependente
			(	
				cd_Dependente		
				,cd_Matricula		
				,nm_Dependente		
				,ds_Sexo			
				,ds_Parentesco		
				,ds_Nacionalidade	
				,dt_Nascimento		
				,ds_NecesEspecial	
				,nm_Mae				
				,no_CPF				
				,no_RG				
				,ds_OrgExp			
				,dt_ExpRG			
				,cd_Status			
				,ds_Log				
				,tp_Operacao		
				,dt_Cadastro			
				,dt_Alteracao		
				,dt_Desativacao		
				,cd_Usuario					
			) 
			VALUES 
			(
				@cdDependente
				,@cdMatricula		
				,@nmDependente	
				,@dsSexo			
				,@dsParentesco		
				,@dsNacionalidade	
				,@dtNascimento		
				,@cdNecesEspecial	
				,@nmMae			
				,@noCPF				
				,@noRG				
				,@dsOrgExp			
				,@dtExpRG			
				,@cdStatus			
				,@dsLog				
				,@tpOperacao		
				,@dtCadastro		
				,@dtAlteracao		
				,@dtDesativacao		
				,@cdUsuario			
			);
	End	
	else
		raiserror ('ATENÇÃO! Falha ao Gerar Log de Dependente',1,18)
		return -1
End