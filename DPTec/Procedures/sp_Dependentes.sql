USE DPtec

GO

Create PROCEDURE sp_Dependente
(
	@cdDependente		Int
	,@cdMatricula  Int
	,@nmDependente  Varchar(80)
	,@dsSexo	Varchar(9)
	,@dsParentesco	Varchar(10)
	,@dsNacionalidade Varchar(40)
	,@dtNascimento	Varchar(40)
	,@dsNecesEspecial	Varchar(40)
	,@nmMae		Varchar(80)
	,@noCPF		Numeric(11)
	,@noRG			Varchar(11)
	,@dsOrgExp	  Varchar(4)
	,@dtExpRG			Varchar(40)
	,@cdStatus		Int
	,@cdUsuario		Int
	,@Op  CHAR(1)
  )
as 
Declare
  @msg Varchar(200)
  ,@cd_Dependente            Int;



BEGIN
Select 
	@cd_Dependente = cd_Dependente
From Dependente
where no_CPF = @noCPF
	  and cd_Matricula = @cdMatricula
   
IF (@Op = 'I')
	Begin
		Insert Into Dependente
			(
				cd_Matricula		
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
			) 
			VALUES (
				@cdMatricula		
				,@nmDependente	
				,@dsSexo			
				,@dsParentesco	
				,@dsNacionalidade
				,Convert(Date, @dtNascimento,105)	
				,@dsNecesEspecial
				,@nmMae			
				,@noCPF			
				,@noRG			
				,@dsOrgExp		
				,Convert(Date, @dtExpRG,105)
				,@cdStatus	
			);
    
  		-- Busca Informações do Dependente para gerar LOG  
		Select 
			  @cd_Dependente = cd_Dependente
		  From Dependente
		  Where 
			  no_CPF = @noCPF;
				
		if @cd_Dependente is not Null
			begin
	  --Inclusão de Log De Alteração
				exec sp_LogDependente @cd_Dependente
									,@cdUsuario
									,@Op
			end          
		Else
		  set @msg = 'ATENÇÃO! Falha ao gerar Log de Inclusão de Dependente'
	end

IF(@Op= 'U') 
	begin
    --Executa as Alteraçoes Solicitadas
		Update Dependente
			Set 
				nm_Dependente = @nmDependente
				,ds_Sexo = @dsSexo			
				,ds_Parentesco = @dsParentesco
				,ds_Nacionalidade = @dsNacionalidade
				,dt_Nascimento = Convert(Date, @dtNascimento,105)
				,ds_NecesEspecial = @dsNecesEspecial
				,nm_Mae = @nmMae
				,no_RG = @noRG
				,ds_OrgExp	= @dsOrgExp
				,dt_ExpRG = Convert(Date, @dtExpRG,105)
				,cd_Status = @cdStatus
			where 
				no_CPF = @noCPF
				and cd_Matricula = @cdMatricula

		-- Busca Informações do Dependente para gerar LOG  
		Select 
			  @cd_Dependente = cd_Dependente
		  From Dependente
		  Where 
			  no_CPF = @noCPF;
				
		if @cd_Dependente is not Null
			begin
	  --Inclusão de Log De Alteração
				exec sp_LogDependente @cd_Dependente
									,@cdUsuario
									,@Op
			end          
		Else
		  set @msg = 'ATENÇÃO! Falha ao gerar Log de Inclusão de Dependente'
	End
	
                    
IF(@Op = 'D')
	begin
    --Realiza Exclusão Logica
		Update Dependente
			Set 
				cd_Status = @cdStatus
			where 
				cd_Dependente = @cdDependente;
						
		-- Busca Informações do Dependente para gerar LOG  
		Select 
			  @cd_Dependente = cd_Dependente
		  From Dependente
		  Where 
			  no_CPF = @noCPF;
				
		if @cd_Dependente is not Null
			begin
	  --Inclusão de Log De Alteração
				exec sp_LogDependente @cd_Dependente
									,@cdUsuario
									,@Op
			end          
		Else
		  set @msg = 'ATENÇÃO! Falha ao gerar Log de Inclusão de Dependente'
	end
End
